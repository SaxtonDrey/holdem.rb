module Cards
  class CardStack
    extend Forwardable
    def_delegators(:@cards, :[], :each, :count, :shuffle!, :pop)

    def initialize
      @cards = []
      Suit::VALID_SUITS.each do |suit|
        Rank::VALUES.each do |rank|
          @cards << Card.new(Suit.new(suit), Rank.new(rank))
        end
      end
      @cards.shuffle!
    end
  end
end