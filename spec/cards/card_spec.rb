require 'spec_helper'

describe Cards::Card do
  describe 'comparing' do
    let(:card1) { Cards::Card.new(suit1, rank1) }
    let(:card2) { Cards::Card.new(suit2, rank2) }
    let(:suit1) { Cards::Suit.new(:d) }
    let(:suit2) { Cards::Suit.new(:s) }
    let(:rank1) { Cards::Rank.new(:K) }
    describe '<=>'
    context 'Kd vs As' do
      let(:rank2) { Cards::Rank.new(:A) }
      it { expect(card1).to be < card2 }
    end

    context 'K vs K' do
      let(:rank2) { Cards::Rank.new(:K) }
      it { expect(card1).to eq card2 }
    end

    context 'K vs Q' do
      let(:rank2) { Cards::Rank.new(:Q) }
      it { expect(card1).to be > card2 }
    end
  end
end