prios = ["-"] + ("a".."z").to_a + ("A".."Z").to_a

puts(
  File
    .readlines("03/input.txt", chomp: true)
    .each_slice(3)
    .sum { |lines| prios.index(lines.map(&:chars).reduce(&:&).first) }
)
