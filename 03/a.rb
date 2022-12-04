prios = ["-"] + ("a".."z").to_a + ("A".."Z").to_a

File
  .readlines("03/input.txt", chomp: true)
  .sum do |line|
    chars = line.chars
    half1, half2 = chars.each_slice(chars.size / 2).to_a
    common = (half1 & half2).first
    prios.index(common)
  end
  .then { |sum| puts sum }
