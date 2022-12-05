stacks = Hash.new { |h, k| h[k] = [] }

File
  .readlines("05/input.txt", chomp: true)
  .each do |line|
    if line =~ /\[[A-Z]\]/
      line.chars.each_with_index do |char, i|
        stacks[i / 4 + 1] << char if char =~ /[A-Z]/
      end
    elsif line =~ /move/
      count, from, to = line.scan(/\d+/).map(&:to_i)
      count.times { stacks[to].unshift(stacks[from].shift) }
    end
  end

puts stacks.keys.sort.map { |k| stacks[k][0] }.join
