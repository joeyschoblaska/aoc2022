require "set"

h = t = [0, 0]
visited = Set.new([[0, 0]])
dirs = { "U" => [0, 1], "D" => [0, -1], "R" => [1, 0], "L" => [-1, 0] }

File.foreach("09/input.txt", chomp: true) do |line|
  dir, dist = dirs[line[/[UDLR]/]], line[/\d+/].to_i

  dist.times do
    h = [h, dir].transpose.map(&:sum)
    xdiff, ydiff = h[0] - t[0], h[1] - t[1]
    next if xdiff.abs < 2 && ydiff.abs < 2 # adjacent; do nothing
    t = [t[0] + xdiff.clamp(-1, 1), t[1] + ydiff.clamp(-1, 1)]
    visited << t
  end
end

puts visited.count
