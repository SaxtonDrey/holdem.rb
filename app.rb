require 'bundler'
Bundler.require
require 'forwardable'
require 'active_support/core_ext'
require 'active_support/dependencies'
require 'active_support/concern'
require 'active_support/inflector'

ActiveSupport::Dependencies.autoload_paths << File.join(File.dirname(__FILE__), './lib/').to_s
