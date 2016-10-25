require 'bundler'
Bundler.require
require 'forwardable'
require 'active_support/core_ext'
require 'active_support/dependencies'
require 'active_support/concern'
require 'active_support/inflector'

ActiveSupport::Dependencies.autoload_paths << File.join(File.dirname(__FILE__), './lib/').to_s

dealer = Tables::Dealer.new

u1 = Tables::User.new
u2 = Tables::User.new
dealer.add_user(u1)
dealer.add_user(u2)
puts 'Dealer > Ok, lets start'
sleep 0.5

while u1.chip_stack > 0 && u2.chip_stack > 0
  5.times do
    dealer.deal
    puts "you recieved #{u1.cards.last}"
    puts "The man recieved #{u2.cards.last}"
    sleep 0.5
  end
  hand1 = Hands::Hand.new(*u1.cards)
  hand2 = Hands::Hand.new(*u2.cards)
  puts "You make #{hand1.rank}"
  puts "The man make #{hand2.rank}"

  if hand1 > hand2
    puts 'You won!'
    u2.pay_to(u1, 50)
  elsif hand1 < hand2
    puts 'You lose.'
    u1.pay_to(u2, 50)
  else
    puts 'draw'
  end
  u1.erase_cards!
  u2.erase_cards!
  puts "You: #{u1.chip_stack}"
  puts "Him: #{u2.chip_stack}"
  dealer.get_cards
end