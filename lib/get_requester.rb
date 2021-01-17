require 'open-uri'
require 'net/http'
require 'json'
require 'pry'

class GetRequester
  attr_accessor :url

  @@all = []

  def initialize(url)
    @url = url
    @@all << self
  end

  def get_response_body
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def parse_json
    json_response = JSON.parse(self.get_response_body)
  end
end