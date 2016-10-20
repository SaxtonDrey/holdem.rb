class Card
  class Rank
    include Comparable

    VALUES = %i(2 3 4 5 6 7 8 9 T J Q K A)

    def initialize(value)
      fail InvalidValueError, "#{value}, #{value.class} is not Symbol or valid rank." unless VALUES.include?(value)
      @val = value
    end

    def <=>(other)
      return nil unless other.is_a?(Rank)
      VALUES.index(self.val) <=> VALUES.index(other.val)
    end

    def to_s
      @val.to_s
    end

    protected

    def val
      @val
    end

    private

    def check_value!(value)
    end

    class InvalidValueError < StandardError; end
  end
end