require 'bundler'
Bundler.require
require 'forwardable'
require 'active_support/core_ext'
require 'active_support/dependencies'
require 'active_support/concern'
require 'active_support/inflector'

ActiveSupport::Dependencies.autoload_paths << File.join(File.dirname(__FILE__), './lib/').to_s

table = Tables::Table.new
cs = Cards::CardStack.new.shuffle!
dealer = Tables::Dealer.new(table, cs)

u1 = Tables::User.new
u2 = Tables::User.new
table.add_user(u1)
table.add_user(u2)
puts 'Dealer > Ok, lets start'
sleep 1

5.times do
  dealer.deal
  puts "you recieved #{u1.cards.last}"
  puts "The man recieved #{u2.cards.last}"
  sleep 2
end
hand1 = Hands::Hand.new(*u1.cards)
hand2 = Hands::Hand.new(*u2.cards)
puts "You make #{hand1.rank}"
puts "The man make #{hand2.rank}"

if hand1 > hand2
  puts 'You won!'
elsif hand1 < hand2
  puts 'You lose.'
else
  puts 'draw'
end
