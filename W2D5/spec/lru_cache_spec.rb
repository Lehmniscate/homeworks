require 'lru_cache'

describe "LRU cache" do
  subject(:cache) { LRUCache.new(5) }

  it "shows the cache" do
    cache.add(15)
    expect(cache.show).to include(15)
  end

  it "removes items from the cache" do
    cache.add(1)
    cache.add(2)
    cache.add(3)
    cache.add(4)
    cache.add(5)
    cache.add(6)
    expect(cache.show).to_not include(1)
  end

  it "gives a count of the cache" do
    cache.add(15)
    expect(cache.count).to eq(1)
  end

  it "orders the cache by most recently used" do
    cache.add(1)
    cache.add(2)
    cache.add(3)
    cache.add(4)
    cache.add(5)
    cache.add(6)
    expect(cache.show).to eq([2,3,4,5,6])
  end
end
