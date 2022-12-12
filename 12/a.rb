require "set"
require_relative "../lib/grid"

grid = Grid.from_file("12/input.txt")
nodes = { grid.index("S") => { visited: false, dist: 0 } }
heights =
  { "S" => 0, "E" => 25 }.tap do |h|
    ("a".."z").each_with_index { |v, i| h[v] = i }
  end

loop do
  cxy = nodes.select { |k, v| !v[:visited] }.min_by { |k, v| v[:dist] }[0]
  cv = grid[*cxy]

  grid.each_neighbor(*cxy, diags: false) do |nxy, nv|
    nodes[nxy] ||= { visited: false, dist: Float::INFINITY }

    if heights[nv] - heights[cv] <= 1
      nodes[nxy][:dist] = [nodes[nxy][:dist], nodes[cxy][:dist] + 1].min
    end
  end

  nodes[cxy][:visited] = true

  break if grid[*cxy] == "E"
end

p nodes[grid.index("E")][:dist]
