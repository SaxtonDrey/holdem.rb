module Cards
  class Rank
    include Comparable

    VALUES = %i(2 3 4 5 6 7 8 9 T J Q K A).freeze

    class << self
      def generate_full_set
        VALUES.map do |v|
          new(v)
        end
      end
    end

    def initialize(value)
      fail InvalidValueError, "#{value}, #{value.class} is not Symbol or valid rank." unless VALUES.include?(value)
      @val = value
    end

    def <=>(other)
      return nil unless other.is_a?(Rank)
      order <=> other.order
    end

    def to_s
      @val.to_s
    end

    def -(other)
      fail ArgumentError, "#{other} is not Card::Rank" unless other.is_a?(Rank)
      order - other.order
    end

    protected

    def order
      VALUES.index(@val)
    end

    class InvalidValueError < StandardError; end
  end
end