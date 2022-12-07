fs = { "/" => {} }
pwd = []

File.foreach("07/input.txt", chomp: true) do |line|
  if chdir = line[/\$ cd (.+)/, 1]
    chdir == ".." ? pwd.pop : pwd << chdir
  elsif dirname = line[/dir (.+)/, 1]
    fs.dig(*pwd)[dirname] = {}
  elsif filematch = line.match(/(\d+) (.+)/)
    fs.dig(*pwd)[filematch[2]] = filematch[1].to_i
  end
end

def dir_sizes(fs, pwd = ["/"])
  dir = fs.dig(*pwd)
  subdirs = dir.keys.select { |k| dir[k].is_a?(Hash) }
  subdir_sizes = subdirs.map { |d| dir_sizes(fs, pwd + [d]) }.reduce(:merge)
  local_size = dir.values.sum { |i| i.is_a?(Integer) ? i : 0 }
  total_size = local_size + subdirs.sum { |d| subdir_sizes[pwd + [d]] }

  { pwd => total_size }.merge(subdir_sizes || {})
end

p dir_sizes(fs).values.sum { |s| s <= 100_000 ? s : 0 }
