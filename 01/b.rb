top = [0, 0, 0]
sum = 0

File
  .readlines("01/input.txt")
  .each do |line|
    if line.strip == ""
      top << sum
      top = top.sort[1..3]
      sum = 0
    else
      sum += line.to_i
    end
  end

p top.sum
