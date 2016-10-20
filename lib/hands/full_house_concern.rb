module Hands
  module FullHouseConcern
  	extend ActiveSupport::Concern
    def compare_same_hand_rank(other)
      return 1 if three_of_a_kind_rank > other.three_of_a_kind_rank
      return -1 if three_of_a_kind_rank < other.three_of_a_kind_rank
      two_pair_rank <=> other.two_pair_rank
    end

    protected

    def three_of_a_kind_rank
      hand.cards.last
    end

    def two_pair_rank
      hand.cards.first
    end	
  end
end