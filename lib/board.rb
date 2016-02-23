class Board
  attr_accessor :board

  def initialize
    @board = [
      [nil,nil,nil,nil,nil,nil,nil],
      [nil,nil,nil,nil,nil,nil,nil],
      [nil,nil,nil,nil,nil,nil,nil],
      [nil,nil,nil,nil,nil,nil,nil],
      [nil,nil,nil,nil,nil,nil,nil],
      [nil,nil,nil,nil,nil,nil,nil]
    ]
    @turns = {}
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

  def add_turn(player, column)
    numerical_column = column.ord - 97
    row_value = 5
    @board.reverse_each do |row|
      if row[numerical_column].nil?
        row[numerical_column] = player
        return row_value
      end
      row_value -= 1
    end
    @turns[player] = column
  end

  def empty_spaces?
    @board.each do |row|
      row.each do |column|
        return true if column.nil?
      end
    end
    return false
  end

  def winner?(player, row, column)
    in_a_row = 0
    #check horizontally
    return horizontal_winner(player,@board[row]) if true
    #check vertically
    reformed_column = []
    @board.each do |row|
      reformed_column << row[column]
    end
    puts reformed_column
    horizontal_winner(player,reformed_column)
    #check diagonally
    false
  end

  def horizontal_winner(player,row)
    first = row.index(player)
    if [row][first+1] == player && @board[row][first+2] == player && @board[row][first+3] == player
      puts "winner found"
      gets
      return true
    end
    false
  end

  def column_full?(column)
    numerical_column = column.ord-97
    return false if @board[0][numerical_column].nil?
    return true
  end
end
