module Tables
  class User
    attr_reader :chip_stack, :name
    attr_accessor :cards

    def initialize(name)
      @name = name
      @cards = []
      @chip_stack = 100
    end

    def bet(amount)
      if @chip_stack >= amount
        @chip_stack -= amount
        amount
      else
        all_in!
      end
    end

    def all_in!
      puts "#{name} All-in!"
      cs = @chip_stack
      @chip_stack = 0
      cs
    end

    def receive(amount)
      @chip_stack += amount
    end

    def erase_cards!
      @cards = []
    end
  end
end