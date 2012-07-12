require 'spec_helper'

describe WeatherTrender do
  let(:weather_trender) { WeatherTrender.new }
  let(:monthly_raw_data){ WeatherTrender.new.parse('weather.dat')}
  let(:monthly_data) {
    [["1", 29],
     ["2", 16],
     ["3", 22],
     ["4", 18],
     ["5", 24],
     ["6", 20],
     ["7", 16],
     ["8", 21],
     ["9", 54],
     ["10", 20],
     ["11", 32],
     ["12", 15],
     ["13", 11],
     ["14", 2],
     ["15", 9],
     ["16", 20],
     ["17", 24],
     ["18", 30],
     ["19", 20],
     ["20", 27],
     ["21", 27],
     ["22", 26],
     ["23", 22],
     ["24", 13],
     ["25", 18],
     ["26", 33],
     ["27", 19],
     ["28", 16],
     ["29", 22],
     ["30", 45]]
  }

  let(:daily_info) { "1  88    59" }

  describe "#parse" do
    it "should open and parse weather.dat" do
      weather_trender.parse("weather.dat").should be_a_kind_of(Array)
    end
  end

  describe "#monthly_weather_data" do
    it "should return an array of monthly data" do
      weather_trender.monthly_weather_data(monthly_raw_data).should be_a_kind_of(Array)
    end

    it "should contain 30 days of data" do
      weather_trender.monthly_weather_data(monthly_raw_data).size.should be 30
    end

  end

  describe "#calculate_daily_temp_diff" do
    it "should correctly calculate the difference between the max and min temp" do
      day = weather_trender.calculate_daily_temp_diff(daily_info)
      day[1].should == 29
    end

    it "should return an array with the day and temp diff" do
      day = weather_trender.calculate_daily_temp_diff(daily_info)
      day.should == ["1", 29]
    end

  end

  describe "#smallest_spread" do
    it "should calculate the day with the smallest temperature spread" do
      weather_trender.smallest_spread(monthly_data).should == [["14", 2]]
    end

    it "should contain a single array" do
      weather_trender.smallest_spread(monthly_data).size.should == 1
    end

  end

  describe "#largest_spread" do
    it "should calculate the day with the largest temperature spread" do
      weather_trender.largest_spread(monthly_data).should == [["9", 54]]
    end

    it "should contain a single array" do
      weather_trender.largest_spread(monthly_data).size.should == 1
    end
  end
end
