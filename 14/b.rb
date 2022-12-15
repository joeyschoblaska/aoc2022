sand_origin = [500, 0]
floor = 2
count = 0
points = {}

File
  .readlines("14/input.txt", chomp: true)
  .each do |line|
    path = line.split(" -> ").map { |xy| xy.split(",").map(&:to_i) }
    path.each_with_index do |xy, i|
      nextxy = path[i + 1]

      next if nextxy.nil?

      loop do
        points[xy] = "#"
        floor = [floor, xy[1] + 2].max
        break if xy == nextxy
        xy = [xy[0] + (nextxy[0] <=> xy[0]), xy[1] + (nextxy[1] <=> xy[1])]
      end
    end
  end

loop do
  sand = sand_origin.dup
  break if points[sand] == "."

  loop do
    if sand[1] + 1 == floor
      points[sand] = "." and break
    elsif points[[sand[0], sand[1] + 1]].nil?
      sand[1] += 1
    elsif points[[sand[0] - 1, sand[1] + 1]].nil?
      sand = [sand[0] - 1, sand[1] + 1]
    elsif points[[sand[0] + 1, sand[1] + 1]].nil?
      sand = [sand[0] + 1, sand[1] + 1]
    else
      points[sand] = "." and break
    end
  end

  count += 1
end

p count
