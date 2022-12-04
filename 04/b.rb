File
  .readlines("04/input.txt")
  .select do |line|
    a, b, c, d = line.scan(/\d+/).map(&:to_i)
    c < a ? d >= a : c <= b
  end
  .then { |overlaps| puts overlaps.count }
