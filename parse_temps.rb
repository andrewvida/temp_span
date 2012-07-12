require_relative 'lib/weather_trender'

weather = WeatherTrender.new
message =  weather.output_smallest_spread('weather.dat')
puts message
