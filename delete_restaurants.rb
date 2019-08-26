require "httparty"
require "pp"

class Partay
  include HTTParty
  base_uri "http://167.71.229.116:1337"
end

ids = [2, 3, 4, 5]

ids.each do |id|
  pp Partay.delete("/foodjoints/#{id}")
end
