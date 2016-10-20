require 'spec_helper'

describe Cards::CardStack do
  describe 'new' do
    it { expect(Card::CardStack.new.count).to be 52 }
  end
end