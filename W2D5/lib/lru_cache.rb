class LRUCache
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.size
  end

  def add(el)
    index = @cache.index(el)
    @cache.delete_at(index) unless index.nil?

    @cache.push(el)

    @cache.shift if @cache.length > @size

    el
  end

  def show
    @cache
  end

  private
  # helper methods go here!

end


if __FILE__ == $0
  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  puts johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})


  p johnny_cache.show
end
