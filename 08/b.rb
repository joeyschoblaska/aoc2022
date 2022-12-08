require "set"

visible = Set.new
forest =
  File.readlines("08/input.txt", chomp: true).map { |l| l.chars.map(&:to_i) }
dirs = [[1, 0], [-1, 0], [0, 1], [0, -1]]

def visible_from(x, y, dir, forest)
  height = forest[y][x]
  visible = 0
  x += dir[0]
  y += dir[1]

  while x >= 0 && y >= 0 && forest[y] && forest[y][x]
    visible += 1
    break unless forest[y][x] < height
    x += dir[0]
    y += dir[1]
  end

  visible
end

(0...forest[0].size)
  .map do |x|
    (0...forest.size).map do |y|
      r = dirs.map { |dir| visible_from(x, y, dir, forest) }.reduce(&:*)
    end
  end
  .flatten
  .max
  .then { |v| p v }
