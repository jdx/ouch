require "ouch/version"
require 'faraday'
require 'nokogiri'

module Ouch
  def self.find(lat: nil, lng: nil)
    conn = Faraday.new("http://www.ushospitalfinder.com")
    response = conn.get '/hospitals/search', { search_query: 'hospital', lat: lat, lng: lng }
    page = Nokogiri::HTML.parse(response.body)
    link = page.css('#list tr:first a').first
    return unless link
    url = link[:href]
    response = conn.get(url)
    page = Nokogiri::HTML.parse(response.body)
    details = page.css('#detail-center p:has(b)')
    data = details.inject({}) do |h, detail|
      h[detail.children[1].children[0].text] = detail.children[2].text.split.join(' ').strip
      h
    end

    {
      name: data["Name:"],
      address: data["Address:"],
      phone: data["Phone:"],
      number_of_beds: data["Number of Beds:"].to_i,
      url: "http://www.ushospitalfinder.com#{url}",
    }
  end
end
