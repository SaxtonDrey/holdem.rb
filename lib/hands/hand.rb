# Straight flush
# Four of a kind
# Full house
# flush
# Straight
# Three of a kind
# Two pair
# One pair
# High card

module Hands
  class Hand
    include Comparable
    attr_reader :cards

    def initialize(*hands)
      fail if hands.size > 5
      fail if hands.size < 4
      @cards = hands.sort.freeze
    end

    def <=>
      # TODO: ハンドの強さ比較を実装
    end

    def rank
      @rank = case true
              when straight_flush?
                :straight_flush
              when four_of_a_kind?
                :four_of_a_kind
              when full_house?
                :full_house
              when flush?
                :flush
              when straight?
                :straight
              when three_of_kind?
                :three_of_kind
              when two_pair?
                :two_pair
              when one_pair?
                :one_pair
              else
                :high_card
              end
    end

    def straight_flush?
      same_suit? && step?
    end

    def four_of_a_kind?
      rank_count.max == 4
    end

    def full_house?
      rank_count.count(3) == 3 && rank_count.count(2) == 2
    end

    def flush?
      same_suit? && !step?
    end

    def straight?
      step? && !same_suit?
    end

    def three_of_kind?
      rank_count.count(3) == 3 && rank_count.count(2) != 2
    end

    def two_pair?
      rank_count.count(2) == 4
    end

    def one_pair?
      rank_count_max == 2 && rank_count.count(2) == 2
    end

    def ranks
      @ranks ||= cards.map(&:rank)
    end

    def rank_count
      @rank_count ||= ranks.map { |rank| ranks.count(rank) }
    end

    def rank_count_max
      @rank_count_max ||= rank_count.max
    end

    def same_suit?
      @same_suit ||= cards.map(&:suit).uniq.size == 1
    end

    def step?
      @step ||= cards.map { |c| c.rank - cards.first.rank } == [0, 1, 2, 3, 4]
    end
  end
end