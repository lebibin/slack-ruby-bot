ENV['RACK_ENV'] = 'test'
require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))
require 'slack-ruby-bot/rspec'
require 'slack-mathbot'
