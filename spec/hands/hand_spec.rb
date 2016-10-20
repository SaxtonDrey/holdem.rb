require 'spec_helper'
describe Hands::Hand do
  let(:hand1) { Hands::Hand.new(card1, card2, card3, card4, card5) }
  let(:card1) { Cards::Card.new(suit1, rank1) }
  let(:card2) { Cards::Card.new(suit2, rank2) }
  let(:card3) { Cards::Card.new(suit3, rank3) }
  let(:card4) { Cards::Card.new(suit4, rank4) }
  let(:card5) { Cards::Card.new(suit5, rank5) }

  let(:suit1) { d }
  let(:suit2) { c }
  let(:suit3) { c }
  let(:suit4) { d }
  let(:suit5) { d }

  let(:rank1) { two }
  let(:rank2) { three }
  let(:rank3) { four }
  let(:rank4) { five }
  let(:rank5) { seven }

  let(:two) { Cards::Rank.new(:'2') }
  let(:three) { Cards::Rank.new(:'3') }
  let(:four) { Cards::Rank.new(:'4') }
  let(:five) { Cards::Rank.new(:'5') }
  let(:six) { Cards::Rank.new(:'6') }
  let(:seven) { Cards::Rank.new(:'7') }
  let(:eight) { Cards::Rank.new(:'8') }
  let(:nine) { Cards::Rank.new(:'9') }
  let(:ten) { Cards::Rank.new(:T) }
  let(:jack) { Cards::Rank.new(:J) }
  let(:queen) { Cards::Rank.new(:Q) }
  let(:king) { Cards::Rank.new(:K) }
  let(:ace) { Cards::Rank.new(:A) }

  let(:d) { Cards::Suit.new(:d) }
  let(:c) { Cards::Suit.new(:c) }
  let(:s) { Cards::Suit.new(:s) }
  let(:h) { Cards::Suit.new(:h) }


  describe '#rank' do
    subject { hand1.rank }

    context 'Straight flush' do
      let(:suit1) { d }
      let(:suit2) { d }
      let(:suit3) { d }
      let(:suit4) { d }
      let(:suit5) { d }

      let(:rank1) { two }
      let(:rank2) { three }
      let(:rank3) { four }
      let(:rank4) { five }
      let(:rank5) { six }

      it { is_expected.to be :straight_flush }
    end

    context 'Four of a kind' do
      let(:suit1) { d }
      let(:suit2) { d }
      let(:suit3) { h }
      let(:suit4) { s }
      let(:suit5) { c }

      let(:rank1) { two }
      let(:rank2) { three }
      let(:rank3) { three }
      let(:rank4) { three }
      let(:rank5) { three }

      it { is_expected.to be :four_of_a_kind }
    end

    context 'Full house' do
      let(:suit1) { d }
      let(:suit2) { h }
      let(:suit3) { s }
      let(:suit4) { c }
      let(:suit5) { d }

      let(:rank1) { two }
      let(:rank2) { two }
      let(:rank3) { three }
      let(:rank4) { three }
      let(:rank5) { three }

      it { is_expected.to be :full_house }
    end

    context 'Flush' do
      let(:suit1) { d }
      let(:suit2) { d }
      let(:suit3) { d }
      let(:suit4) { d }
      let(:suit5) { d }

      let(:rank1) { two }
      let(:rank2) { three }
      let(:rank3) { four }
      let(:rank4) { seven }
      let(:rank5) { ace }

      it { is_expected.to be :flush }
    end

    context 'straight' do
      let(:suit1) { c }
      let(:suit2) { d }
      let(:suit3) { h }
      let(:suit4) { d }
      let(:suit5) { d }

      let(:rank1) { two }
      let(:rank2) { three }
      let(:rank3) { four }
      let(:rank4) { five }
      let(:rank5) { six }

      it { is_expected.to be :straight }
    end

    context 'three of kind' do
      let(:suit1) { d }
      let(:suit2) { c }
      let(:suit3) { s }
      let(:suit4) { d }
      let(:suit5) { d }

      let(:rank1) { two }
      let(:rank2) { two }
      let(:rank3) { two }
      let(:rank4) { seven }
      let(:rank5) { ace }

      it { is_expected.to be :three_of_kind }
    end

    context 'two pair' do
      let(:suit1) { d }
      let(:suit2) { s }
      let(:suit3) { d }
      let(:suit4) { c }
      let(:suit5) { d }

      let(:rank1) { two }
      let(:rank2) { two }
      let(:rank3) { four }
      let(:rank4) { four }
      let(:rank5) { ace }

      it { is_expected.to be :two_pair }
    end
    context 'One pair' do
      let(:suit1) { d }
      let(:suit2) { s }
      let(:suit3) { d }
      let(:suit4) { d }
      let(:suit5) { d }

      let(:rank1) { two }
      let(:rank2) { two }
      let(:rank3) { four }
      let(:rank4) { seven }
      let(:rank5) { ace }

      it { is_expected.to be :one_pair }
    end

    context 'High card' do
      it { is_expected.to be :high_card }
    end
  end
end