File
  .readlines("04/input.txt")
  .select do |line|
    a, b, c, d = line.scan(/\d+/).map(&:to_i)
    (a >= c && b <= d) || (c >= a && d <= b)
  end
  .then { |contains| puts contains.count }
