describe Turn do
  let(:board) { Board.new}
  let(:player) { Player.new('j',"Joe") }
  let(:column) { 'a' }
  let(:turn) { Turn.new(board,player,column) }

  it 'has a board' do
    expect(turn.board).to eq (board)
  end

  it 'has a player' do
    expect(turn.player).to eq(player)
  end

  it 'has column index' do
    expect(turn.column).to eq('a')
  end


  context 'checks for win conditions' do
    context 'horizontally' do
      it 'recognizes win if a row with 4 in a row is found'
      it 'does not recognize win if there is less than 4 in a row'
      it 'does not recognize win if there is an unoccupied space'
    end
    context 'vertically' do
      it 'recognizes a win if a column has 4 in a row'
      it 'does not recognize if there is less than 4 in a column'
    end
    context 'diagonally' do
      it 'recognizes a win if there are 4 in a row diagonally with positive slope'
      it 'recognizes a win if there are 4 in a row diagonally with neg slope'
      it 'does not recognize win if there is an unoccupied space'
      it 'does not recognize win if diagonal is interrupted by other player'
    end
  end
end
