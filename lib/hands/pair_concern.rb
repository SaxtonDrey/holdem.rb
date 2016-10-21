module Hands
  module PairConcern
    extend ActiveSupport::Concern

    def compare_same_hand_rank(other)
      pairs_set.each_with_index do |rank, idx|
        res = rank <=> other.pairs_set[idx]
        return res if res != 0
      end
      0
    end

    protected

    def pairs_set
      ranks     = []
      new_cards = hand.cards.dup
      if hand.rank_count.count(3) == 3
        # full house
        # three of a kind
        ranks << new_cards.slice!(hand.rank_count.index(3), 3).map(&:rank)
      elsif hand.rank_count.count(2) == 2
        # one pair
        ranks << new_cards.slice!(hand.rank_count.index(2), 2).map(&:rank)
      elsif hand.rank_count.count(4) == 4
        # four of a kind
        ranks << new_cards.slice!(hand.rank_count.index(4), 4).map(&:rank)
      elsif hand.rank_count.count(2) == 4
        # two pair
        # TODO: ペア同士の大小比較
        ranks << new_cards.slice!(hand.rank_count.index(2), 2).map(&:rank)
        ranks << new_cards.slice!(hand.rank_count.index(2), 2).map(&:rank)
      end
      ranks << Array(new_cards).map(&:rank).reverse
    end
  end
end