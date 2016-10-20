require 'bundler'
Bundler.require
require 'forwardable'
require 'active_support/dependencies'
ActiveSupport::Dependencies.autoload_paths << File.join(File.dirname(__FILE__), './lib/').to_s
