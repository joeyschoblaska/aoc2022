lines = File.readlines("10/input.txt", chomp: true)
processing = nil
cycle = 0
signals = []
x = 1

while lines.any? || processing
  cycle += 1

  print ((cycle - 1) % 40 - x).abs < 2 ? "#" : "."
  puts if cycle % 40 == 0

  if processing
    x += processing
    processing = nil
  else
    line = lines.shift
    next if line == "noop"
    processing = line[/[-\d]+/].to_i
  end
end
