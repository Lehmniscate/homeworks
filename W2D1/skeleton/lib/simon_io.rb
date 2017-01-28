require 'colorize'
require 'io/console'

class SimonIO

  DISPLAY = [
    {
      color: :red,
      display: [' ','o ',' ']
    },{
      color: :blue,
      display: [' o ',' ','']
    },{
      color: :green,
      display: ['',' ',' o ']
    },{
      color: :yellow,
      display: [' ',' o',' ']
    }
  ]

  def self.display_color(lit = [])
    output = nil
    DISPLAY.each do |color|
      background = :black
      background = color[:color] if lit.include? color[:color].to_s
      output ||= Array.new(color[:display].size) {''}
      output = output.map.with_index do |line, i|
        line + color[:display][i].colorize(color: color[:color],
          background: background)
      end
    end
    output.each {|line| puts line}
  end

  def self.read_char
    STDIN.echo = false
    STDIN.raw!

    input = STDIN.getc.chr
    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil
      input << STDIN.read_nonblock(2) rescue nil
    end
  ensure
    STDIN.echo = true
    STDIN.cooked!

    return input
  end
end

# char = ''
# until char == 'q'
#   char = SimonIO.read_char
#   case char
#  when " "
#    puts "SPACE"
#  when "\t"
#    puts "TAB"
#  when "\r"
#    puts "RETURN"
#  when "\n"
#    puts "LINE FEED"
#  when "\e"
#    puts "ESCAPE"
#  when "\e[A"
#    puts "UP ARROW"
#  when "\e[B"
#    puts "DOWN ARROW"
#  when "\e[C"
#    puts "RIGHT ARROW"
#  when "\e[D"
#    puts "LEFT ARROW"
#  when "\177"
#    puts "BACKSPACE"
#  when "\004"
#    puts "DELETE"
#  when "\e[3~"
#    puts "ALTERNATE DELETE"
#  when "\u0003"
#    puts "CONTROL-C"
#    exit 0
#  when /^.$/
#    puts "SINGLE CHAR HIT: #{char.inspect}"
#  else
#    puts "SOMETHING ELSE: #{char.inspect}"
# end
# end
