module Cards
  class Card
    include Comparable
    attr_reader :suit, :rank

    def initialize(suit, rank)
      @suit = suit
      @rank = rank
    end

    def <=>(other)
      return unless other.is_a?(Card)
      @rank <=> other.rank
    end
  end
end