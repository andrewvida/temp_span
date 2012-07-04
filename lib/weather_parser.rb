class WeatherParser

  TempLineRegex = /^\s*\d+\.?\s+/

  def output_smallest_temperature_spread(file)
    temps = parse(file)
    "June #{temps[0][0]} had the smallest temperature spread of #{temps[0][1]} degrees."
  end

  private

  def parse(file)
    File.readlines(file).inject([]) do |stack, line|
      process_line(stack, line)
    end
  end

  def process_line(stack, line)
    if line =~ TempLineRegex
      day, max_temp, min_temp = line.split
      temp_spread = (max_temp.to_i) - (min_temp.to_i)
      stack << [day, temp_spread] if stack.size == 0
      if temp_spread <= stack[0][1]
        stack.clear
        stack << [day, temp_spread]
      end
    end
    stack
  end
end
