class Board
  def initialize
    @board = [
      [nil,nil,nil,nil,nil,nil,nil],
      [nil,nil,nil,nil,nil,nil,nil],
      [nil,nil,nil,nil,nil,nil,nil],
      [nil,nil,nil,nil,nil,nil,nil],
      [nil,nil,nil,nil,nil,nil,nil],
      [nil,nil,nil,nil,nil,nil,nil]
    ]
    @turns = 0
  end

  def print
    printed_board = ""
    @board.each do |row|
      printed_board << "|"
      row.each_with_index do |element,index|
        printed_board << " " if index != 0
        printed_board << element unless element.nil?
        printed_board << "-" if element.nil?
      end
      printed_board << "|\n"
    end
    printed_board <<" a b c d e f g "
  end

  def rows
    @board
  end

  def add_turn(player, row, column)
    @board[row-1][column-1] = player
    @turns += 1
  end

  def has_empty_spaces?
    @board.each do |row|
      row.each do |column|
        return true if column.nil?
      end
    end
    return false
  end

  def winner?
    false
  end
end
