require 'spec_helper'
describe Hands::Hand do
  let(:hand1) { HandGenerator.generate(hand_str1) }

  describe '#rank' do
    subject { hand1.rank }

    context 'Straight flush' do
      let(:hand_str1) { 'AsKsQsJsTs' }
      it { is_expected.to be_a_kind_of(Hands::Hand::StraightFlush) }
      context '例外' do
        context 'A2345' do
          let(:hand_str1) { 'Ac2c3c4c5c' }
          it { is_expected.to be_a_kind_of(Hands::Hand::StraightFlush) }
        end

        context 'KA234' do
          let(:hand_str1) { 'KcAc2c3c4c' }
          it { is_expected.to be_a_kind_of(Hands::Hand::Flush) }
        end
      end
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
      context '例外' do
        context 'A2345' do
          let(:hand_str1) { 'As2c3h4c5d' }
          it { is_expected.to be_a_kind_of(Hands::Hand::Straight) }
        end

        context 'KA234' do
          let(:hand_str1) { 'KsAc2d3h4c' }
          it { is_expected.to be_a_kind_of(Hands::Hand::HighCard) }
        end
      end
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
    let(:hand2) { HandGenerator.generate(hand_str2) }
    context 'with different rank' do
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

    describe 'with same rank' do
      subject { hand1 }
      context 'Straight flush' do
        let(:hand_str1) { 'KsQsJsTs9s' }
        it { expect(hand1.rank).to be_a_kind_of(Hands::Hand::StraightFlush) }
        context 'over straight flush' do
          let(:hand_str2) { 'AhKhQhJhTh' }
          it { is_expected.to be < hand2 }
        end

        context 'same rank' do
          let(:hand_str2) { 'KhQhJhTh9h' }
          it { is_expected.to eq hand2 }
        end
      end

      context 'Four of a kind' do
        let(:hand_str1) { '4s4d4h4c5d' }
        it { expect(hand1.rank).to be_a_kind_of(Hands::Hand::FourOfAKind) }
        context 'Four of a kind' do
          let(:hand_str2) { '6s6d6h6c5d' }
          it { is_expected.to be < hand2 }
        end

        context 'same Four of a kind,with high' do
          let(:hand_str2) { '4s4d4h4c8d' }
          it { is_expected.to be < hand2 }
        end

        context 'same Four of a kind' do
          let(:hand_str2) { '4s4d4h4c5c' }
          it { is_expected.to eq hand2 }
        end
      end

      context 'Full house' do
        let(:hand_str1) { '4s4d4h5c5d' }
        it { expect(hand1.rank).to be_a_kind_of(Hands::Hand::FullHouse) }
        context 'Four of a kind' do
          let(:hand_str2) { '5s5d5h6c6d' }
          it { is_expected.to be < hand2 }
        end

        context 'over 3, over 2' do
          let(:hand_str2) { 'AsAdAhKcKd' }
          it { is_expected.to be < hand2 }
        end

        context 'same 3, over 2' do
          let(:hand_str2) { '4s4d4hKcKd' }
          it { is_expected.to be < hand2 }
        end

        context 'same 3, same 2' do
          let(:hand_str2) { '4s4d4d6h6c' }
          it { is_expected.to be < hand2 }
        end
      end

      context 'Flush' do
        let(:hand_str1) { '2d4d5d9dKd' }
        it { expect(hand1.rank).to be_a_kind_of(Hands::Hand::Flush) }
        context 'over flush' do
          let(:hand_str2) { 'Ad4d5d9dKd' }
          it { is_expected.to be < hand2 }
        end

        context 'same rank' do
          let(:hand_str2) { '2d4d5d9dKd' }
          it { is_expected.to eq hand2 }
        end
      end

      context 'Straight' do
        let(:hand_str1) { '3d4h5c6d7d' }
        it { expect(hand1.rank).to be_a_kind_of(Hands::Hand::Straight) }
        context 'over straight' do
          let(:hand_str2) { '4h5c6d7d8c' }
          it { is_expected.to be < hand2 }
        end

        context 'same rank' do
          let(:hand_str2) { '3d4h5c6d7d' }
          it { is_expected.to eq hand2 }
        end
      end

      context 'Three of a kind' do
        let(:hand_str1) { '4d4h4c8d9d' }
        it { expect(hand1.rank).to be_a_kind_of(Hands::Hand::ThreeOfAKind) }

        context 'over 3' do
          let(:hand_str2) { '5h5c5d7d8c' }
          it { is_expected.to be < hand2 }
        end

        context 'same 3, higher 2' do
          let(:hand_str2) { '4h4c4dAdQc' }
          it { is_expected.to be < hand2 }
        end

        context 'same 3, higher 1' do
          let(:hand_str2) { '4h4c4dAd2c' }
          it { is_expected.to be < hand2 }
        end

        context 'same 3, same 2' do
          let(:hand_str2) { '4h4c4d8d9c' }
          it { is_expected.to eq hand2 }
        end
      end

      context 'Two pair' do
        let(:hand_str1) { '4d4h7c7d9d' }
        it { expect(hand1.rank).to be_a_kind_of(Hands::Hand::TwoPair) }

        context 'over pair' do
          let(:hand_str2) { '5h5c3d8d8c' }
          it { is_expected.to be < hand2 }
        end

        context 'over 1 pair' do
          let(:hand_str2) { 'AhAc2d2d3c' }
          it { is_expected.to be < hand2 }
        end

        context 'same 2 pair, higher 1' do
          let(:hand_str2) { '4h4c7d7dAc' }
          it { is_expected.to be < hand2 }
        end

        context 'same 5' do
          let(:hand_str2) { '4c4d7d7h9d' }
          it { is_expected.to eq hand2 }
        end
      end

      context 'One pair' do
        let(:hand_str1) { '4d4h7c8d9d' }
        it { expect(hand1.rank).to be_a_kind_of(Hands::Hand::OnePair) }

        context 'over pair' do
          let(:hand_str2) { '5h5c3d7d8c' }
          it { is_expected.to be < hand2 }
        end

        context 'same pair, higher 3' do
          let(:hand_str2) { '4h4cAdKdQc' }
          it { is_expected.to be < hand2 }
        end

        context 'same 3, higher 2' do
          let(:hand_str2) { '4h4cKdQd2c' }
          it { is_expected.to be < hand2 }
        end

        context 'same 3, higher1' do
          let(:hand_str2) { '4h4cAd2d3c' }
          it { is_expected.to be < hand2 }
        end

        context 'same 5' do
          let(:hand_str2) { '4c4d7d8c9h' }
          it { is_expected.to eq hand2 }
        end
      end

      context 'High card' do
        let(:hand_str1) { '2d3h4c5d7d' }
        it { expect(hand1.rank).to be_a_kind_of(Hands::Hand::HighCard) }

        context 'over 5' do
          let(:hand_str2) { 'AhKcQdJd9c' }
          it { is_expected.to be < hand2 }
        end

        context 'over4' do
          let(:hand_str2) { 'AhKcQdJd2c' }
          it { is_expected.to be < hand2 }
        end

        context 'over3' do
          let(:hand_str2) { 'AhKcQd3d2c' }
          it { is_expected.to be < hand2 }
        end

        context 'over2' do
          let(:hand_str2) { 'AhKc4c3d2c' }
          it { is_expected.to be < hand2 }
        end

        context 'over1' do
          let(:hand_str2) { 'Kh5c4c3d2c' }
          it { is_expected.to be < hand2 }
        end

        context 'same 3' do
          let(:hand_str2) { '2c3d4h5d7d' }
          it { is_expected.to eq hand2 }
        end
      end
    end
  end
end