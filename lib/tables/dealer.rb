module Tables
  class Dealer
    def deal(user, cards)
      user.cards << cards.pop
    end

    def deal_public(cards)
      cards.pop
    end
  end
end