require "set"

visible = Set.new
forest =
  File.readlines("08/input.txt", chomp: true).map { |l| l.chars.map(&:to_i) }

def visible_from(x, y, dir, forest)
  tallest = -1
  visible = []

  while forest[y] && forest[y][x]
    visible << [x, y] if forest[y][x] > tallest
    tallest = [forest[y][x], tallest].max
    x += dir[0]
    y += dir[1]
  end

  visible
end

(0...forest.size).each do |y|
  visible += visible_from(0, y, [1, 0], forest)
  visible += visible_from(forest[0].size - 1, y, [-1, 0], forest)
end

(0...forest[0].size).each do |x|
  visible += visible_from(x, 0, [0, 1], forest)
  visible += visible_from(x, forest.size - 1, [0, -1], forest)
end

p visible.count
