module HandGenerator
  class << self
    # HandGenerator
    # @param [String] 'AsKdQhJcTc'
    # @return [Hands::Hand]
    def generate(string)
      cards = string.scan(/.{1,2}/).reduce([]) { |a, c| a << CardGenerator.generate(c) }
      Hands::Hand.new(*cards)
    end
  end
end