module Tables
  class User
    attr_reader :chip_stack
    attr_accessor :cards

    def initialize
      @cards = []
      @chip_stack = 100
    end

    def pay_to(user, amount)
      @chip_stack -= amount
      user.receive(amount)
    end

    def receive(amount)
      @chip_stack += amount
    end

    def erase_cards!
      @cards = []
    end
  end
end