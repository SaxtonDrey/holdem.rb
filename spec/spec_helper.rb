require 'bundler'

Bundler.require

require 'active_support/dependencies'
ActiveSupport::Dependencies.autoload_paths << File.join(File.dirname(__FILE__), '/../lib/').to_s