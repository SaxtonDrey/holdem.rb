module Hands
  module PairConcern
  	extend ActiveSupport::Concern
    def compare_same_hand_rank(other)
      pairs_set.each_with_index do |rank, idx|
        rank <=> others.pairs_set[idx]
       end	
    end

    protected

     def pairs_set
  	  ranks = []
  	  new_cards = hand.cards.dep
  	  if hands.rank_count(2) == 2
        ranks << new_cards.slice!(hands.rank_count.index(2), 2).map(&:rank)
  	  elsif hands.rank_count(4) == 4
  	  	ranks << new_cards.slice!(hands.rank_count.index(4), 4).map(&:rank)
      elsif hands.rank_count(2) == 4
      	ranks << new_cards.slice!(hands.rank_count.index(2), 2).map(&:rank)
      	ranks << new_cards.slice!(hands.rank_count.index(2), 2).map(&:rank)
      end
      ranks << new_cards.map(&:rank)
  	end
  end
end