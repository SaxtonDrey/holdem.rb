require 'bundler'
Bundler.require
require 'active_support/core_ext'
require 'active_support/dependencies'
require 'forwardable'
require './spec/factories/card_generator'
require './spec/factories/hand_generator'

ActiveSupport::Dependencies.autoload_paths << File.join(File.dirname(__FILE__), '/../lib/').to_s