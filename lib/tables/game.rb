module Tables
  class Game
    extend Forwardable
    attr_reader :chip_stack, :small_blind
    def_delegators(:@table, :users, :dealer)

    def initialize(table, sb)
      clear_chip!
      @small_blind = sb
      @table = table
      @flop = []
      @turn = []
      @river = []
    end

    def start
      set_card!
      collect_blinds!
      pre_flop!
      flop!
      turn!
      river!
      show_result
      users.rotate!
    end

    private

    def deal(user)
      user.cards << @cards.pop
    end

    def deal_public
      @cards.pop
    end

    def set_card!
      @cards = Cards::CardStack.new
    end

    def pre_flop!
      2.times { users.map { |u| deal(u) } }
    end

    def flop!
      3.times { @flop << deal_public }
      puts Hands::Hand.new(*@flop)
    end

    def turn!
      puts Hands::Hand.new(*(@turn << deal_public))
    end

    def river!
      puts Hands::Hand.new(*(@river << deal_public))
    end

    def show_result
      users.map { |u| puts "#{u.name} had #{Hands::Hand.new(*u.cards)}" }
      users.map { |u| puts "#{u.name} made #{Hands::HoldemHand.new(u.cards, @flop, @turn, @river).pick.rank}" }
      winner = users.sort {|a, b| Hands::HoldemHand.new(a.cards, @flop, @turn, @river).pick <=> Hands::HoldemHand.new(b.cards, @flop, @turn, @river).pick }.last
      puts "winner #{winner.name} gets #{chip_stack}"
      pay_all(winner)
    end

    def pay_all(user)
      user.receive(chip_stack.tap { clear_chip!})
    end

    def clear_chip!
      @chip_stack = 0
    end

    def collect_blinds!
      sb = users[-2]
      bb = users[-1]
      sb_paid = sb.bet(small_blind)
      receive sb_paid
      puts "#{sb.name} bet #{sb_paid} as SB"
      bb_paid = bb.bet(big_blind)
      receive bb_paid
      puts "#{bb.name} bet #{bb_paid} as BB"
    end

    def receive(amount)
      @chip_stack += amount
    end

    def collect(amount)
      @chip_stack += amount
    end

    def big_blind
      @small_blind * 2
    end
  end
end