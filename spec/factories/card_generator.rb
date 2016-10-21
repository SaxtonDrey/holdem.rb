module CardGenerator
  class << self
    # CardGenerator
    # @param [String] 'As'
    # @return [Cards::Card]
    def generate(string)
      suit = Cards::Suit.new(string[1].to_sym)
      rank = Cards::Rank.new(string[0].to_sym)

      Cards::Card.new(suit, rank)
    end
  end
end