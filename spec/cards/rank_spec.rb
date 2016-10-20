require 'spec_helper'

describe Cards::Rank do
  describe '#new' do
    context '不適切なランク' do
      it { expect { Cards::Rank.new(0) }.to raise_error Cards::Rank::InvalidValueError }
      it { expect { Cards::Rank.new(:'1') }.to raise_error Cards::Rank::InvalidValueError }
      it { expect { Cards::Rank.new(2) }.to raise_error Cards::Rank::InvalidValueError }
      it { expect { Cards::Rank.new(3) }.to raise_error Cards::Rank::InvalidValueError }
      it { expect { Cards::Rank.new('9') }.to raise_error Cards::Rank::InvalidValueError }
      it { expect { Cards::Rank.new(:'10') }.to raise_error Cards::Rank::InvalidValueError }
      it { expect { Cards::Rank.new(:'11') }.to raise_error Cards::Rank::InvalidValueError }
      it { expect { Cards::Rank.new(12) }.to raise_error Cards::Rank::InvalidValueError }
      it { expect { Cards::Rank.new(13) }.to raise_error Cards::Rank::InvalidValueError }
    end

    context '適切なランク' do
      it { expect(Cards::Rank.new(:'2')).to be_kind_of(Cards::Rank) }
      it { expect(Cards::Rank.new(:'3')).to be_kind_of(Cards::Rank) }
      it { expect(Cards::Rank.new(:'4')).to be_kind_of(Cards::Rank) }
      it { expect(Cards::Rank.new(:'5')).to be_kind_of(Cards::Rank) }
      it { expect(Cards::Rank.new(:'6')).to be_kind_of(Cards::Rank) }
      it { expect(Cards::Rank.new(:'7')).to be_kind_of(Cards::Rank) }
      it { expect(Cards::Rank.new(:'8')).to be_kind_of(Cards::Rank) }
      it { expect(Cards::Rank.new(:'9')).to be_kind_of(Cards::Rank) }
      it { expect(Cards::Rank.new(:T)).to be_kind_of(Cards::Rank) }
      it { expect(Cards::Rank.new(:J)).to be_kind_of(Cards::Rank) }
      it { expect(Cards::Rank.new(:Q)).to be_kind_of(Cards::Rank) }
      it { expect(Cards::Rank.new(:K)).to be_kind_of(Cards::Rank) }
      it { expect(Cards::Rank.new(:A)).to be_kind_of(Cards::Rank) }
    end
  end

  describe 'comparing' do
    let(:rank1) { Cards::Rank.new(value1) }
    let(:rank2) { Cards::Rank.new(value2) }
    let(:value1) { :K }

    describe '<=>'
    context 'K vs A' do
      let(:value2) { :A }
      it { expect(rank1).to be < rank2 }
    end

    context 'K vs K' do
      let(:value2) { :K }
      it { expect(rank1).to eq rank2 }
    end

    context 'K vs Q' do
      let(:value2) { :Q }
      it { expect(rank1).to be > rank2 }
    end

    describe '#-' do
      let(:rank1) { Cards::Rank.new(value1) }
      let(:rank2) { Cards::Rank.new(value2) }

      context 'K - Q' do
        let(:value2) { :Q }
        it { expect(rank1 - rank2).to be 1}
      end

      context 'K - T' do
        let(:value2) { :T }
        it { expect(rank1 - rank2).to be 3}
      end

      context 'K - 2' do
        let(:value2) { :'2' }
        it { expect(rank1 - rank2).to be 11}
      end

      context 'A - K' do
        let(:value1) { :A }
        let(:value2) { :K }
        it { expect(rank1 - rank2).to be 1}
      end
    end
  end
end