chars = File.read("06/input.txt").chomp.chars

(4..chars.size - 1)
  .find { |i| chars[i - 4, 4].uniq.count == 4 }
  .then { |i| puts i }
