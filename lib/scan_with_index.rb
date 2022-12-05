class String
  def scan_with_index(pattern)
    scan(pattern) { |match| yield match, $~.offset(0)[0] }
  end
end
