require 'spec_helper'
require_relative "../lib/board"

describe Board do
  board = Board.new
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
    board.add_turn('x',1,2)

    board_printout =
      "|- x - - - - -|\n" +
      "|- - - - - - -|\n" +
      "|- - - - - - -|\n" +
      "|- - - - - - -|\n" +
      "|- - - - - - -|\n" +
      "|- - - - - - -|\n" +
      " a b c d e f g "
    expect(board.print).to eq(board_printout)
  end

  it "places a player in lower right of board" do
    board = Board.new
    board.add_turn('o',6,7)
    board_printout =
      "|- - - - - - -|\n" +
      "|- - - - - - -|\n" +
      "|- - - - - - -|\n" +
      "|- - - - - - -|\n" +
      "|- - - - - - -|\n" +
      "|- - - - - - o|\n" +
      " a b c d e f g "
    expect(board.print).to eq(board_printout)
  end

  it "knows if there are empty spaces" do
    expect(board.has_empty_spaces?).to eq(true)
  end

  it "can tell when there are no empty spaces" do
    6.times do |row|
      7.times do |column|
        board.add_turn('x', row+1, column+1)
      end
    end

    expect(board.has_empty_spaces?).to eq(false)
  end
end
