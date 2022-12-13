require "json"
require_relative "../lib/enumerable_ext"
require_relative "../lib/array_ext"

def in_order?(left, right)
  if [left, right].all? { |v| v.is_a?(Integer) }
    return true if left < right
    return false if left > right
  else
    left, right = Array.wrap(left), Array.wrap(right)

    while left.any? && right.any?
      in_order?(left.shift, right.shift).then { |io| return io unless io.nil? }
    end

    return true if left.empty? && right.any?
    return false if left.any? && right.empty?
  end
end

File
  .readlines("13/input.txt", chomp: true)
  .each_slice(3)
  .map { |l, r, _| [JSON.parse(l), JSON.parse(r)] }
  .sum_with_index { |pair, i| in_order?(*pair) ? i + 1 : 0 }
  .then { |sum| puts sum }
