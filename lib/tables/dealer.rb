module Tables
  class Dealer
    def initialize
      @table = Tables::Table.new
      get_cards
    end

    def deal
      @table.users.each do |user|
        user.cards << @cards.pop
      end
    end

    def get_cards
      @cards = Cards::CardStack.new
    end

    def add_user(user)
      @table. add_user(user)
    end
  end
end