module Hands
  module HandCompareConcern
    extend ActiveSupport::Concern
    attr_reader :hand
    include Comparable
    HAND_RANKS = %w(straight_flush four_of_a_lind full_house flush straight three_of_a_kind two_pair one_pair high_card).freeze
    
    def initialize(hand)
      @hand = hand
    end 
       
    def <=>(other)
      return unless other.respond_to?(:index_of_hand_rank)
      return -1 if index_of_hand_rank > other.index_of_hand_rank
      return 1 if index_of_hand_rank < other.index_of_hand_rank
      compare_same_hand_rank(other) 
    end

    def index_of_hand_rank
      cls = self.class
      HAND_RANKS.index(cls.name.demodulize.underscore)
    end

    def classname1
      cls = self.class
      cls.name.demodulize
    end

    def classname2
      self.class.name.demodulize
    end

    def anc
      ancestors
    end  
    def compare_same_hand_rank
      0
    end   
  end
end