max = 0
sum = 0

File
  .readlines("01/input.txt")
  .each do |line|
    if line.strip == ""
      max = [max, sum].max
      sum = 0
    else
      sum += line.to_i
    end
  end

p max
