require_relative 'simon_io'
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      @sequence_length += 1
      round_success_message
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      SimonIO.display_color([color])
      sleep 0.5
      SimonIO.display_color()
      sleep 0.5
    end
    SimonIO.display_color
  end

  def require_sequence
    input = SimonIO.get_sequence(@seq.length)
    @game_over = true unless input == @seq
  end

  def add_random_color
    @seq << COLORS.shuffle.first
  end

  def round_success_message
    SimonIO.display_color
    puts "Congratulations you passed this round!"
    sleep 1
  end

  def game_over_message
    system 'clear'
    puts "Sorry you failed..."
    puts "It was #{@seq.join(" ")}"
  end

  def reset_game
    @seq = []
    @sequence_length = 1
    @game_over = false
  end
end


if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
