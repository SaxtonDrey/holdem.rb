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
  	  ranks = []
  	  new_cards = hand.cards.dup
  	  if hand.rank_count.count(2) == 2
        ranks << new_cards.slice!(hands.rank_count.index(2), 2).map(&:rank)
  	  elsif hand.rank_count.count(4) == 4
  	  	ranks << new_cards.slice!(hands.rank_count.index(4), 4).map(&:rank)
      elsif hand.rank_count.count(2) == 4
      	ranks << new_cards.slice!(hands.rank_count.index(2), 2).map(&:rank)
      	ranks << new_cards.slice!(hands.rank_count.index(2), 2).map(&:rank)
      end
      ranks << new_cards.map(&:rank)
  	end
  end
end