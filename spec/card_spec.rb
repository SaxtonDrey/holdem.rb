require 'spec_helper'

describe Card::Rank do
  describe 'comparing' do
    let(:card1) { Card.new(suit1, rank1) }
    let(:card2) { Card.new(suit2, rank2) }
    let(:suit1) { Card::Suit.new(:d) }
    let(:suit2) { Card::Suit.new(:s) }
    let(:rank1) { Card::Rank.new(:K) }
    describe '<=>'
    context 'Kd vs As' do
      let(:rank2) { Card::Rank.new(:A) }
      it { expect(card1).to be < card2 }
    end

    context 'K vs K' do
      let(:rank2) { Card::Rank.new(:K) }
      it { expect(card1).to eq card2 }
    end

    context 'K vs Q' do
      let(:rank2) { Card::Rank.new(:Q) }
      it { expect(card1).to be > card2 }
    end
  end
end