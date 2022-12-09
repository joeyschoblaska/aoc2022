require "set"

knots = Array.new(10, [0, 0])
visited = Set.new([[0, 0]])
dirs = { "U" => [0, 1], "D" => [0, -1], "R" => [1, 0], "L" => [-1, 0] }

File.foreach("09/input.txt", chomp: true) do |line|
  dir, dist = dirs[line[/[UDLR]/]], line[/\d+/].to_i

  dist.times do
    knots.each_with_index do |knot, i|
      if i == 0
        knots[i] = [knot, dir].transpose.map(&:sum)
      else
        xdiff, ydiff = knots[i - 1][0] - knot[0], knots[i - 1][1] - knot[1]
        next if xdiff.abs < 2 && ydiff.abs < 2 # adjacent, do nothing
        knots[i] = [knot[0] + xdiff.clamp(-1, 1), knot[1] + ydiff.clamp(-1, 1)]
      end
    end

    visited << knots.last
  end
end

puts visited.count
