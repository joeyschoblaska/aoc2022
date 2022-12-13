class Array
  def self.wrap(elem)
    elem.is_a?(Array) ? elem : [elem]
  end
end
