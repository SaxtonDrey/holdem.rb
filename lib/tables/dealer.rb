module Tables
  class Dealer
    def initialize(table, cards)
      @table = table
      @cards = cards
    end

    def deal
      @table.users.each do |user|
        user.cards << @cards.pop
      end
    end
  end
end