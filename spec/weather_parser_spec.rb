require 'weather_parser'

describe WeatherParser do
  let(:wp) { WeatherParser.new}

  it "should display the day with the smallest temperature spread" do
    wp.output_smallest_temperature_spread('weather.dat').should == "June 14 had the smallest temperature spread of 2 degrees."
  end
end
