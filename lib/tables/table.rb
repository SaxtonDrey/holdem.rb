module Tables
  class Table
    attr_reader :users
    def initialize
      @users = []
    end

    def add_user(user)
      @users << user
    end

    def delete_user(user)
      @users.delete(user)
    end
  end
end