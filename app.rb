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


puts 'Enter your Name'
u1 = Tables::User.new
table.add_user(u1)
puts "Dealer > Ok, lets start"

5.times do
  dealer.deal
  puts "you recieved #{u1.cards.last}"
end

puts "You make #{Hands::Hand.new(*u1.cards).rank}"