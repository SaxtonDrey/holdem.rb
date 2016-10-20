require 'spec_helper'

describe Cards::Suit do
  describe '#new' do
    context '不適切なスーツ' do
      it { expect { Cards::Suit.new(:K) }.to raise_error Cards::Suit::InvalidSuitError }
      it { expect { Cards::Suit.new(:S) }.to raise_error Cards::Suit::InvalidSuitError }
      it { expect { Cards::Suit.new(1) }.to raise_error Cards::Suit::InvalidSuitError }
      it { expect { Cards::Suit.new('s') }.to raise_error Cards::Suit::InvalidSuitError }
    end

    context '適切なスーツ' do
      it { expect(Cards::Suit.new(:d)).to be_kind_of(Cards::Suit) }
      it { expect(Cards::Suit.new(:h)).to be_kind_of(Cards::Suit) }
      it { expect(Cards::Suit.new(:s)).to be_kind_of(Cards::Suit) }
      it { expect(Cards::Suit.new(:c)).to be_kind_of(Cards::Suit) }
    end
  end
end

