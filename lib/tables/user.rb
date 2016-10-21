module Tables
  class User
    attr_accessor :cards
    def initialize
      @cards = []
    end
  end
end