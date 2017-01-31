class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new(4) {:stone}}
    @cups[6],@cups[13] = [],[]
    @player_one, @player_two = name1, name2
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1,14)
  end

  def make_move(start_pos, current_player_name)
    num_stones = @cups[start_pos].count
    @cups[start_pos] = []
    i = 1
    cup = start_pos
    until num_stones < 1
      cup = (start_pos + i) % 14
      unless (cup == 6 && current_player_name == @player_two) ||
              (cup == 13 && current_player_name == @player_one)
        num_stones -= 1
        @cups[cup] << :stone
      end
      i += 1
    end
    render
    next_turn(cup, current_player_name)
  end

  def next_turn(end_cup, player)
    return :prompt if (end_cup == 6 && player == @player_one) ||
                      (end_cup == 13 && player = @player_two)
    return :switch if @cups[end_cup] == [:stone]
    end_cup
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
  end

  def winner
    case @cups[6].count <=> @cups[13].count
    when -1 then return @player_two
    when 0 then return :draw
    when 1 then return @player_one
    end
  end
end
