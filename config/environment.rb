# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'

require 'tumblr_client'

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')

Tumblr.configure do |config|
  config.consumer_key = "doc60oi3x7VJA3PlJR7B3sRQmuOwSvYMp5CQrP6j7N900zrEEs"
  config.consumer_secret = "gKsMIXX3FrgstmqSkNWglh1PV0diCK8d08UNC6aSaMjhaawdm1"
  config.oauth_token = "FX9LOOK1oWy8QMI6JS5cHlAlJodoV29EyPe692so2tRdNNaVKy"
  config.oauth_token_secret = "pT7qaswqL68zeqI3duNOkjApr2UswYUD8XoiKQdggPalxGdLIU"
end