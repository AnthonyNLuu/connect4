class Turn
  attr_accessor :player
  attr_reader :column, :board

  def initialize(board, player, column)
    @board = board
    @player = player
    @column = column
  end

end
