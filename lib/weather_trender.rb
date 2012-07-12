class WeatherTrender
  TempLineRegex = /^\s*\d+\.?\s+/


  def output_smallest_spread(weather_data)
    raw_data = parse(weather_data)
    daily_data = monthly_weather_data(raw_data)
    small_message_output(smallest_spread(daily_data))
  end

  def parse(weather_data)
    File.readlines(weather_data)
  end

  def monthly_weather_data(weather_data)
    monthly_info = []
    weather_data.each do |temp_line|
      if temp_line =~ TempLineRegex
        monthly_info << calculate_daily_temp_diff(temp_line)
      end
    end
    monthly_info
  end

  def calculate_daily_temp_diff daily_info
    day, max_temp, min_temp =  daily_info.split
    temp_diff = (max_temp.to_i) - (min_temp.to_i)
    [day, temp_diff]
  end

  def smallest_spread(monthly_info)
    smallest_item = []
    monthly_info.each do |day|
      smallest_item << day if smallest_item.size == 0
      if day[1] <= smallest_item[0][1]
        smallest_item.clear
        smallest_item << day
      end
    end
    smallest_item.flatten
  end

  def small_message_output(smallest_item)
    "June #{smallest_item[0]} had the smallest temperature spread of #{smallest_item[1]} degrees."
  end


  def largest_spread(monthly_info)
    largest_item = []
    monthly_info.each do |day|
      largest_item << day if largest_item.size == 0
      if day[1] >= largest_item[0][1]
        largest_item.clear
        largest_item << day
      end
    end
    largest_item.flatten
  end
end
