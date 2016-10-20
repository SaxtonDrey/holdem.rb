class Card
  SUITS = %i(dire clover heart spade)
  NUMBERS = %w(A 2 3 4 5 6 7 8 9 T J Q K)
  attr_reader :suit, :number

  class << self
    def rand
      new(VALUES.sample)
    end
  end

  def initialize(suit, number)
    @suit = suit
    @number = number
  end

  def to_s
    "#{number}#{suit}"
  end
end