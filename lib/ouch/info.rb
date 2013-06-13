require 'faraday'
require 'nokogiri'

module Ouch
  class Info
    def initialize(lat: nil, lng: nil)
      conn = Faraday.new("http://www.ushospitalfinder.com")
      response = conn.get '/hospitals/search', { search_query: 'hospital', lat: lat, lng: lng }
      page = Nokogiri::HTML.parse(response.body)
      @url = page.css('#list tr:first a')[0][:href]
      response = conn.get(@url)
      page = Nokogiri::HTML.parse(response.body)
      details = page.css('#detail-center p:has(b)')
      @data = details.inject({}) do |data, detail|
        data[detail.children[1].children[0].text] = detail.children[2].text.split.join(' ').strip
        data
      end
    end

    def name
      @data["Name:"]
    end

    def address
      @data["Address:"]
    end

    def phone
      @data["Phone:"]
    end

    def number_of_beds
      @data["Number of Beds:"].to_i
    end

    def url
      "http://www.ushospitalfinder.com#{@url}"
    end
  end
end
