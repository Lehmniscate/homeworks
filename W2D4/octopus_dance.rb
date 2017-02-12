def slow_dance(dir, tiles_array)
  tiles_array.each_with_index { |tile, i| return i if tile == dir }
end

def fast_dance(dir, tiles_hash)
  tiles_hash[dir]
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

start_time = Time.new
puts "Slow dance for the first item in the array"
5000000.times { slow_dance("up", tiles_array) }
puts "slow dance took #{Time.new - start_time}"

start_time = Time.new
puts "Slow dance for the last item in the array"
5000000.times { slow_dance("left-up", tiles_array) }
puts "slow dance took #{Time.new - start_time}"

start_time = Time.new
5000000.times { fast_dance("right-down", tiles_hash) }
puts "fast dance took #{Time.new - start_time}"
