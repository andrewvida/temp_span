require 'spec_helper'

describe WeatherTrender do
  let(:weather_trender) { WeatherTrender.new }

  describe "#parse" do
    it "should open and parse weather.dat" do
      weather_trender.parse("weather.dat").should be_a_kind_of(Array)
    end
  end

  describe "#monthly_weather_data" do
    it "should return an array of monthly data"

  end

  describe "#calculate_daily_temp_diff" do
    it "should correctly calculate the difference between the max and min temp"

    it "should return an array with the day and temp diff"

  end

  describe "#smallest_spread" do
    it "should calculate the day with the smallest temperature spread"

    it "should contain a single array"

  end

  describe "#largest_spread" do
    it "should calculate the day with the largest temperature spread"

    it "should contain a single array"

  end

  # describe "#smallest_spread" do
  #   it "should open and parse weather.dat" do
  #     weather_trender.smallest_spread("weather.dat").should be_a_kind_of(Array)
  #   end

  #   it "should strip the header from the weather data" do
  #     weather_trender.smallest_spread("weather.dat").include?("(Unofficial, Preliminary Data). Source: <a\n").should be_false
  #   end
  # end


end
