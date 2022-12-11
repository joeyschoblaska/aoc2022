require_relative "../lib/string_ext"

class Monkey
  attr_accessor :items, :operation, :test, :inspected

  def initialize
    @inspected = 0
  end

  def inspect_next_item(monkeys)
    item = items.shift
    item = apply_op(item) / 3
    monkeys[test[item % test[0] == 0 ? 1 : 2]].items << item
    @inspected += 1
  end

  def apply_op(old)
    eval operation
  end
end

monkeys = []

File.open("11/input.txt") do |file|
  while line = file.gets
    if line =~ /Monkey/
      monkey = Monkey.new
      monkey.items = file.gets.ints
      monkey.operation = file.gets[%r{old [+\-*/] (old|\d+)}]
      monkey.test = 3.times.map { file.gets }.join.ints
      monkeys << monkey
    end
  end
end

20.times do
  monkeys.each do |monkey|
    monkey.inspect_next_item(monkeys) while monkey.items.any?
  end
end

p monkeys.map(&:inspected).sort.last(2).reduce(&:*)
