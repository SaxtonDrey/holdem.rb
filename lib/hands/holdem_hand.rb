module Hands
  class HoldemHand
    def initialize(cards, flop, turn, river)
      @cards = cards + flop + turn + river
    end

    def pick
      com = []
      @cards.combination(5) {|a,b,c,d,e| com << Hands::Hand.new(a, b, c, d, e) }
      com.sort.last
    end
  end
end
