module Hands
  module FlushConcern
  	extend ActiveSupport::Concern
    def compare_same_hand_rank(other)
      biggest_rank <=> other.biggest_rank
    end

    protected

    def biggest_rank
      hand.cards.last
    end
  end
end