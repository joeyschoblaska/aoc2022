require "json"
require_relative "../lib/enumerable_ext"
require_relative "../lib/array_ext"

def in_order?(left, right)
  if [left, right].all? { |v| v.is_a?(Integer) }
    return true if left < right
    return false if left > right
  else
    left, right = Array.wrap(left), Array.wrap(right)
    count = [left.count, right.count].min

    count.times do |i|
      in_order?(left[i], right[i]).then { |io| return io unless io.nil? }
    end

    return true if left.count < right.count
    return false if left.count > right.count
  end
end

File
  .readlines("13/input.txt", chomp: true)
  .select { |line| line != "" }
  .map { |line| JSON.parse(line) }
  .then { |packets| packets + [[[2]], [[6]]] }
  .sort do |left, right|
    res = in_order?(left.dup, right.dup)
    res.nil? ? 0 : res ? -1 : 1
  end
  .then { |packets| p (packets.index([[2]]) + 1) * (packets.index([[6]]) + 1) }
