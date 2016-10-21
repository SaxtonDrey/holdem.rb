require 'spec_helper'
describe Hands::Hand do
  let(:hand1) { HandGenerator.generate(hand_str1) }

  describe '#rank' do
    subject { hand1.rank }

    context 'Straight flush' do
      let(:hand_str1) { 'AsKsQsJsTs' }
      it { is_expected.to be_a_kind_of(Hands::Hand::StraightFlush) }
    end

    context 'Four of a kind' do
      let(:hand_str1) { '8s8c8d8hTs' }
      it { is_expected.to be_a_kind_of(Hands::Hand::FourOfAKind) }
    end

    context 'Full house' do
      let(:hand_str1) { '8s8c8dThTs' }
      it { is_expected.to be_a_kind_of(Hands::Hand::FullHouse) }
    end

    context 'Flush' do
      let(:hand_str1) { '2s7s8s9sTs' }
      it { is_expected.to be_a_kind_of(Hands::Hand::Flush) }
    end

    context 'straight' do
      let(:hand_str1) { '2s3d4s5h6c' }
      it { is_expected.to be_a_kind_of(Hands::Hand::Straight) }
    end

    context 'three of kind' do
      let(:hand_str1) { '2s2d2c4h6c' }
      it { is_expected.to be_a_kind_of(Hands::Hand::ThreeOfAKind) }
    end

    context 'two pair' do
      let(:hand_str1) { '2s2d4c4h6c' }
      it { is_expected.to be_a_kind_of(Hands::Hand::TwoPair) }
    end

    context 'One pair' do
      let(:hand_str1) { '2s2d4c5h6c' }
      it { is_expected.to be_a_kind_of(Hands::Hand::OnePair) }
    end

    context 'High card' do
      let(:hand_str1) { '2s7d4c5h6c' }
      it { is_expected.to be_a_kind_of(Hands::Hand::HighCard) }
    end
  end

  describe 'comparing' do
    context 'with different rank' do
      let(:hand2) { HandGenerator.generate(hand_str2) }
      subject { hand1 }

      shared_examples 'VS Four of a kind' do
        context do
          let(:hand_str2) { '8s8c8d8hTd' }
          it { expect(hand2.rank).to be_a_kind_of(Hands::Hand::FourOfAKind) }
          it { is_expected.to be > hand2 }
        end
      end

      shared_examples 'VS Full house' do
        context do
          let(:hand_str2) { '8s8c8dThTd' }
          it { expect(hand2.rank).to be_a_kind_of(Hands::Hand::FullHouse) }
          it { is_expected.to be > hand2 }
        end
      end

      shared_examples 'VS Flush' do
        context do
          let(:hand_str2) { '2s3s6s8s9s' }
          it { expect(hand2.rank).to be_a_kind_of(Hands::Hand::Flush) }
          it { is_expected.to be > hand2 }
        end
      end

      shared_examples 'VS Straight' do
        context do
          let(:hand_str2) { '2s3c4d5h6s' }
          it { expect(hand2.rank).to be_a_kind_of(Hands::Hand::Straight) }
          it { is_expected.to be > hand2 }
        end
      end

      shared_examples 'VS Three of a kind' do
        context do
          let(:hand_str2) { '2s8c8d8hTd' }
          it { expect(hand2.rank).to be_a_kind_of(Hands::Hand::ThreeOfAKind) }
          it { is_expected.to be > hand2 }
        end
      end

      shared_examples 'VS Two pair' do
        context do
          let(:hand_str2) { '2s8c8dThTd' }
          it { expect(hand2.rank).to be_a_kind_of(Hands::Hand::TwoPair) }
          it { is_expected.to be > hand2 }
        end
      end

      shared_examples 'VS One pair' do
        context do
          let(:hand_str2) { '2s3c8d8hTd' }
          it { expect(hand2.rank).to be_a_kind_of(Hands::Hand::OnePair) }
          it { is_expected.to be > hand2 }
        end
      end

      shared_examples 'VS High card' do
        context do
          let(:hand_str2) { '2s3c8d9hTd' }
          it { expect(hand2.rank).to be_a_kind_of(Hands::Hand::HighCard) }
          it { is_expected.to be > hand2 }
        end
      end


      context 'Straight flush' do
        let(:hand_str1) { 'AsKsQsJsTs' }
        it { expect(hand1.rank).to be_a_kind_of(Hands::Hand::StraightFlush) }
        include_examples 'VS Full house'
        include_examples 'VS Flush'
        include_examples 'VS Straight'
        include_examples 'VS Three of a kind'
        include_examples 'VS Two pair'
        include_examples 'VS One pair'
        include_examples 'VS High card'
      end

      context 'Four of a kind' do
        let(:hand_str1) { '8s8c8d8hTd' }
        include_examples 'VS Full house'
        include_examples 'VS Flush'
        include_examples 'VS Straight'
        include_examples 'VS Three of a kind'
        include_examples 'VS Two pair'
        include_examples 'VS One pair'
        include_examples 'VS High card'
      end

      context 'Full House' do
        let(:hand_str1) { '8s8c8dThTd' }
        include_examples 'VS Flush'
        include_examples 'VS Straight'
        include_examples 'VS Three of a kind'
        include_examples 'VS Two pair'
        include_examples 'VS One pair'
        include_examples 'VS High card'
      end

      context 'Flush' do
        let(:hand_str1) { '2s7s8s9sTs' }
        include_examples 'VS Straight'
        include_examples 'VS Three of a kind'
        include_examples 'VS Two pair'
        include_examples 'VS One pair'
        include_examples 'VS High card'
      end

      context 'Straight' do
        let(:hand_str1) { '2s3c4d5h6s' }
        include_examples 'VS Three of a kind'
        include_examples 'VS Two pair'
        include_examples 'VS One pair'
        include_examples 'VS High card'
      end

      context 'Three of a kind' do
        let(:hand_str1) { '2s8c8d8hTd' }
        include_examples 'VS Two pair'
        include_examples 'VS One pair'
        include_examples 'VS High card'
      end

      context 'Two pair' do
        let(:hand_str1) { '2s8c8dThTd' }
        it { expect(hand1.rank).to be_a_kind_of(Hands::Hand::TwoPair) }
        include_examples 'VS One pair'
        include_examples 'VS High card'
      end

      context 'One pair' do
        let(:hand_str1) { '2s3c8d8hTd' }
        it { expect(hand1.rank).to be_a_kind_of(Hands::Hand::OnePair) }
        include_examples 'VS High card'
      end
    end
  end
end