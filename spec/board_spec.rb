require 'spec_helper'

describe Board do
  let (:board) { Board.new }
  let (:player) { Player.new("x", "Joe")}

  it "is initialized to have 6 rows with 7 columns" do
    expect(board.rows.size).to eq(6)
    expect(board.rows[0].size).to eq(7)
  end

  it "prints 6 rows with 7 columns" do
    board_printout =
      "|- - - - - - -|\n" +
      "|- - - - - - -|\n" +
      "|- - - - - - -|\n" +
      "|- - - - - - -|\n" +
      "|- - - - - - -|\n" +
      "|- - - - - - -|\n" +
      " a b c d e f g "
    expect(board.print).to eq(board_printout)
  end

  it "places a player on the board" do
    board.add_turn(player.character,'a')

    board_printout =
      "|- - - - - - -|\n" +
      "|- - - - - - -|\n" +
      "|- - - - - - -|\n" +
      "|- - - - - - -|\n" +
      "|- - - - - - -|\n" +
      "|x - - - - - -|\n" +
      " a b c d e f g "
    expect(board.print).to eq(board_printout)
  end

  it "places a second player in same row correctly" do
    board.add_turn(player.character,'a')
    board.add_turn(player.character, 'a')
    board_printout =
      "|- - - - - - -|\n" +
      "|- - - - - - -|\n" +
      "|- - - - - - -|\n" +
      "|- - - - - - -|\n" +
      "|x - - - - - -|\n" +
      "|x - - - - - -|\n" +
      " a b c d e f g "
    expect(board.print).to eq(board_printout)
  end

  it "knows if there are empty spaces" do
    expect(board.empty_spaces?).to eq(true)
  end

  it "can tell when the column is not full" do
    expect(board.column_full?("d")).to eq(false)
  end



  it "can tell when there are no empty spaces" do
    board.board.each_with_index do |row, r|
      row.each_with_index do |spot, s|
        board.board[r][s] = 'x'
      end
    end
    puts board.print
    expect(board.empty_spaces?).to eq(false)
  end


  it "can tell when the column is full" do
    board.board.each_with_index do |row, r|
      row.each_with_index do |spot, s|
        board.board[r][s] = 'x'
      end
    end
    expect(board.column_full?("d")).to eq(true)
  end


end
