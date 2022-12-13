module Enumerable
  def sum_with_index
    sum = 0
    each_with_index { |elem, index| sum += yield elem, index }
    sum
  end
end
