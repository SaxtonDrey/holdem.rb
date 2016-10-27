require 'bundler'
Bundler.require
require 'forwardable'
require 'active_support/core_ext'
require 'active_support/dependencies'
require 'active_support/concern'
require 'active_support/inflector'

ActiveSupport::Dependencies.autoload_paths << File.join(File.dirname(__FILE__), './lib/').to_s

table = Tables::Table.new
users =[]
users << Tables::User.new('You')
users << Tables::User.new('Alpha')
users << Tables::User.new('Beta')
users << Tables::User.new('Charlie')
users << Tables::User.new('Delta')
users.map { |user|
  table.add_user(user)
}
puts 'Dealer > Ok, lets start'
sleep 0.5

rank = []
idx = 1
sb = 25
loop do
  break if table.users.count == 1
  if idx % 10 == 0
    sb *= 2
    puts '++++++++++++++++++++++++++++++++'
    puts "       BLINDS UP TO #{sb}       "
    puts '++++++++++++++++++++++++++++++++'
  end
  puts '================================'
  game = Tables::Game.new(table, sb)
  game.start

  users.map { |user|
    user.erase_cards!
    puts "#{user.name}: #{user.chip_stack}"
  }
  loosers = table.users.partition { |u| u.chip_stack > 0 }.last
  loosers.map { |l| table.delete_user(l) }
  rank += loosers
  idx += 1
end

puts "1. #{table.users.first.name}"
rank.reverse.each.with_index(2) do |u, idx|
  puts "#{idx}. #{u.name}"
end