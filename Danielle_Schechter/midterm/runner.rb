require 'rest-client'
require 'json'
require_relative 'outfit.rb'

puts "Hello, I'm FashionBot. I'm here to help you look your finest. Whats your name?"
name = gets.chomp

if name.empty? 
	puts "I Need your name"
else	

puts "Nice to meet your #{name}! I'm here to rescue you from social embarassment. Let me know your zip code and I'll tell you what to wear."
zip = gets.chomp
end

result = RestClient.get("http://api.wunderground.com/api/#{ENV['WEATHERAPIKEY']}/forecast/q/#{zip}.json")
parsed = JSON.parse result

city = RestClient.get("http://api.wunderground.com/api/#{ENV['WEATHERAPIKEY']}/geolookup/q/#{zip}.json")
parsed_city = JSON.parse city

outfits = parsed["forecast"]["simpleforecast"]["forecastday"].collect do |day|
	Outfit.new day["conditions"], day['date']['weekday'], day['date']['monthname'], day['date']['day']
end

city = City.new parsed_city["location"]["city"]

puts "Here's your outfit forecast for #{city.city_name}:"
puts 
outfits.each do |outfit|
	# puts "Day: #{outfit.weekday}"
	# puts "Conditions: #{outfit.conditions}"
	# puts
	#THIS IS WHATS GOING ON HERE
	puts outfit.info
end