# game
# board
# players
# spots
require_relative "board"
require_relative "player"
require 'colorize'

# Get users info
puts "Welcome to Connect 4 - by Luu"
puts "\n"
print "Player X, what is your name? "
x_player = Player.new('x',gets.chomp)
print "Player O, what is your name? "
o_player = Player.new('o',gets.chomp)
puts "Hello, #{x_player.name} and #{o_player.name}, Press enter key to start!"
gets.chomp
system "clear"

board = Board.new
turn = 0
no_winner = true
while board.empty_spaces? && no_winner
  puts "Here's the current board:"
  puts board.print

  #determine turn
  if turn % 2 == 0
    print "It's your turn #{x_player.name}, choose your column: "
    current_player = x_player
    symbol = x_player.character.green
  else
    print "It's your turn #{o_player.name}, choose your column: "
    current_player = o_player
    symbol = o_player.character.yellow
  end

  #get valid input
  valid_input = false
  while (!valid_input)
    input = gets.chomp
    if (!["a","b","c","d","e","f","g"].include?(input[0].downcase))
      print "Sorry, invalid column. Please pick a valid column: "
      redo
    end

    if (board.column_full?(input))
      print "Sorry that column is full. Please pick another column: "
      redo
    end
    valid_input = true
  end

  row_value = board.add_turn(symbol,input)
  column_value = input.ord - 97

  turn += 1
  system "clear"
  if board.winner?(symbol,row_value,column_value)
    no_winner = false
    winner = current_player.name
  end
end


# Post result
if board.winner?(symbol,row_value,column_value)
  puts board.print
  puts "#{winner} is the winner!"
elsif !board.empty_spaces?
  puts board.print
  puts "It is a tie!"
else
  puts "There was an error!"
end
