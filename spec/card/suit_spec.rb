require 'spec_helper'

describe Card::Suit do
  describe '#new' do
    context '不適切なスーツ' do
      it { expect { Card::Suit.new(:K) }.to raise_error Card::Suit::InvalidSuitError }
      it { expect { Card::Suit.new(:S) }.to raise_error Card::Suit::InvalidSuitError }
      it { expect { Card::Suit.new(1) }.to raise_error Card::Suit::InvalidSuitError }
      it { expect { Card::Suit.new('s') }.to raise_error Card::Suit::InvalidSuitError }
    end

    context '適切なスーツ' do
      it { expect(Card::Suit.new(:d)).to be_kind_of(Card::Suit) }
      it { expect(Card::Suit.new(:h)).to be_kind_of(Card::Suit) }
      it { expect(Card::Suit.new(:s)).to be_kind_of(Card::Suit) }
      it { expect(Card::Suit.new(:c)).to be_kind_of(Card::Suit) }
    end
  end
end

