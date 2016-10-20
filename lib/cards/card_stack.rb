module Cards
  class CardStack
    attr_reader :cards

    def initialize
      @cards = []
      Suit::VALID_SUITS.each do |suit|
        Rank::VALUES.each do |rank|
          @cards << Card.new(suit, rank)
        end
      end
    end

    def shuffle!
      @cards.shuffle!
    end
  end
end