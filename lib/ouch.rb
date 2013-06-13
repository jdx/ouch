require "ouch/version"
require "ouch/info"

module Ouch
  def self.find(lat: nil, lng: nil)
    Info.new(lat: lat, lng: lng)
  end
end
