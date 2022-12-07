chars = File.read("06/input.txt").chomp.chars
len = 14

(len..chars.size - 1)
  .find { |i| chars[i - len, len].uniq.count == len }
  .then { |i| puts i }
