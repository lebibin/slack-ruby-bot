$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))
require 'simplecov'
SimpleCov.start

require 'slack-ruby-bot/rspec'
require 'slack-mathbot'
