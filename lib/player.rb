class Player
  attr_reader :character, :name

  def initialize(letter, name = "Joe")
    @character = letter
    @name = name
  end

end
