lines = File.readlines("10/input.txt", chomp: true)
processing = nil
cycle = 0
signals = []
x = 1

while lines.any? || processing
  cycle += 1

  signals << cycle * x if (cycle - 20) % 40 == 0

  if processing
    x += processing
    processing = nil
  else
    line = lines.shift
    next if line == "noop"
    processing = line[/[-\d]+/].to_i
  end
end

p signals.sum
