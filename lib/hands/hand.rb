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

    def initialize(*cards)
      fail 'cards too many' if cards.size > 5
      fail 'cards too less'if cards.size < 4
      @cards = cards.sort.freeze
    end

    def <=>(other)
      rank <=> other.rank
    end

    def rank
      @rank ||= case true
              when straight_flush?
                StraightFlush.new(self)
              when four_of_a_kind?
                FourOfAKind.new(self)
              when full_house?
                FullHouse.new(self)
              when flush?
                Flush.new(self)
              when straight?
                Straight.new(self)
              when three_of_kind?
                ThreeOfAKind.new(self)
              when two_pair?
                TwoPair.new(self)
              when one_pair?
                OnePair.new(self)
              else
                HighCard.new(self)
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
      @step ||= cards.map { |c| c.rank - cards.first.rank }.in?([[0, 1, 2, 3, 4], [0, 1, 2, 3, 12]])
    end

    class StraightFlush
      include HandCompareConcern
      include StraightConcern
    end

    class Straight
      include HandCompareConcern
      include StraightConcern
    end

    class Straight
      include HandCompareConcern
      include StraightConcern
    end


    class Flush
      include HandCompareConcern
      include FlushConcern
    end


    class FullHouse
      include HandCompareConcern
      include PairConcern
    end

    class FourOfAKind
      include HandCompareConcern
      include PairConcern
    end

    class ThreeOfAKind
      include HandCompareConcern
      include PairConcern
    end

    class TwoPair
      include HandCompareConcern
      include PairConcern
    end

    class OnePair
      include HandCompareConcern
      include PairConcern
    end

    class HighCard
      include HandCompareConcern
      include PairConcern
    end
  end
end