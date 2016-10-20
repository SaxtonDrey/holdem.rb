require 'spec_helper'

describe Card::Rank do
  describe '#new' do
    context '不適切なランク' do
      it { expect { Card::Rank.new(0) }.to raise_error Card::Rank::InvalidValueError }
      it { expect { Card::Rank.new(:'1') }.to raise_error Card::Rank::InvalidValueError }
      it { expect { Card::Rank.new(2) }.to raise_error Card::Rank::InvalidValueError }
      it { expect { Card::Rank.new(3) }.to raise_error Card::Rank::InvalidValueError }
      it { expect { Card::Rank.new('9') }.to raise_error Card::Rank::InvalidValueError }
      it { expect { Card::Rank.new(:'10') }.to raise_error Card::Rank::InvalidValueError }
      it { expect { Card::Rank.new(:'11') }.to raise_error Card::Rank::InvalidValueError }
      it { expect { Card::Rank.new(12) }.to raise_error Card::Rank::InvalidValueError }
      it { expect { Card::Rank.new(13) }.to raise_error Card::Rank::InvalidValueError }
    end

    context '適切なランク' do
      it { expect(Card::Rank.new(:'2')).to be_kind_of(Card::Rank) }
      it { expect(Card::Rank.new(:'3')).to be_kind_of(Card::Rank) }
      it { expect(Card::Rank.new(:'4')).to be_kind_of(Card::Rank) }
      it { expect(Card::Rank.new(:'5')).to be_kind_of(Card::Rank) }
      it { expect(Card::Rank.new(:'6')).to be_kind_of(Card::Rank) }
      it { expect(Card::Rank.new(:'7')).to be_kind_of(Card::Rank) }
      it { expect(Card::Rank.new(:'8')).to be_kind_of(Card::Rank) }
      it { expect(Card::Rank.new(:'9')).to be_kind_of(Card::Rank) }
      it { expect(Card::Rank.new(:T)).to be_kind_of(Card::Rank) }
      it { expect(Card::Rank.new(:J)).to be_kind_of(Card::Rank) }
      it { expect(Card::Rank.new(:Q)).to be_kind_of(Card::Rank) }
      it { expect(Card::Rank.new(:K)).to be_kind_of(Card::Rank) }
      it { expect(Card::Rank.new(:A)).to be_kind_of(Card::Rank) }
    end
  end

  describe 'comparing' do
    let(:card1) { Card::Rank.new(value1) }
    let(:card2) { Card::Rank.new(value2) }
    let(:value1) { :K }

    describe '<=>'
    context 'K vs A' do
      let(:value2) { :A }
      it { expect(card1).to be < card2 }
    end

    context 'K vs K' do
      let(:value2) { :K }
      it { expect(card1).to eq card2 }
    end

    context 'K vs Q' do
      let(:value2) { :Q }
      it { expect(card1).to be > card2 }
    end
  end
end