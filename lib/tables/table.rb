module Tables
  class Table
    attr_reader :users, :dealer
    def initialize
      @users = []
    end

    def set_dealer(dealer)
      @dealer = dealer
    end

    def add_user(user)
      @users << user
    end
  end
end