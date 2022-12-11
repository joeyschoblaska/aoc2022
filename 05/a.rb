require_relative "../lib/string_ext"

stacks = Hash.new { |h, k| h[k] = [] }

File.foreach("05/input.txt", chomp: true) do |line|
  if line =~ /\[[A-Z]\]/
    line.scan_with_index(/[A-Z]/) { |m, i| stacks[i / 4 + 1] << m }
  elsif line =~ /move/
    count, from, to = line.scan(/\d+/).map(&:to_i)
    count.times { stacks[to].unshift(stacks[from].shift) }
  end
end

puts stacks.keys.sort.map { |k| stacks[k][0] }.join
