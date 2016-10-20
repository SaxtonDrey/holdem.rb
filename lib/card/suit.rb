class Card
  class Suit
    VALID_SUITS = %i(d h c s)

    def initialize(value)
      fail InvalidSuitError, "#{value}, #{value.class} is not Symbol or valid suit #{ VALID_SUITS.reduce('') { |m, s| m << s.to_s }}." unless VALID_SUITS.include?(value)
      @val = value
    end

    class InvalidSuitError < StandardError; end
  end
end