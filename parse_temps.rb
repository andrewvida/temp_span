require_relative 'lib/weather_parser'

weather = WeatherParser.new
message =  weather.output_smallest_temperature_spread('weather.dat')
puts message
