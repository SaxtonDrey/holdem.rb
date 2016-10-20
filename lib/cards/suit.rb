module Cards
  class Suit
    VALID_SUITS = %i(d h c s).freeze

    def initialize(value)
      fail InvalidSuitError, "#{value}, #{value.class} is not Symbol or valid suit #{ VALID_SUITS.reduce('') { |m, s| m << s.to_s }}." unless VALID_SUITS.include?(value)
      @val = value
    end

    def hash
      @val.hash
    end

    def eql?(other)
      @val.eql?(other.val)
    end

    protected

    def val
      @val
    end

    class InvalidSuitError < StandardError; end
  end
end