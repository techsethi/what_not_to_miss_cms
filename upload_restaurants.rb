require "httparty"
require "pp"

class Partay
  include HTTParty
  base_uri "http://167.71.229.116:1337"
end

CSV.foreach("listings_jaipur.csv", :encoding => "windows-1251:utf-8") do |line|
  name, desc, extra = line
  puts "Sending [#{name}], [#{desc} #{extra.nil? ? "" : extra}]"

  # options = {
  #   body: {
  #     name: "A Test Listing",
  #     description: "a Test description",
  #      {
  #       city: {name: "Gurgaon"}
  #     }
  # }

  data = {
    body: {
      name: "#{name}",
      description: "#{desc} #{extra.nil? ? "" : extra}",
      city: 12,
    },
  }

  pp Partay.post("/foodjoints", data)
end
