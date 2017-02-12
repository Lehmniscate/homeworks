class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    old_pair = @map.select {|pair| pair.first == key}.first
    old_pair.nil? ? @map.push([key, value]) : old_pair[1] = value
  end

  def lookup(key)
    @map.each {|pair| return pair.last if pair.first == key}
  end

  def remove(key)
    @map.delete_if? {|pair| pair.first == key }
  end

  def show
    @map.map(&:dup)
  end
end
