require_relative "../lib/scan_with_index.rb"

stacks = Hash.new { |h, k| h[k] = [] }

File
  .readlines("05/input.txt", chomp: true)
  .each do |line|
    if line =~ /\[[A-Z]\]/
      line.scan_with_index(/[A-Z]/) { |m, i| stacks[i / 4 + 1] << m }
    elsif line =~ /move/
      count, from, to = line.scan(/\d+/).map(&:to_i)
      stacks[to].unshift(*stacks[from].shift(count))
    end
  end

puts stacks.keys.sort.map { |k| stacks[k][0] }.join
