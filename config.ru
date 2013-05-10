environment = (ENV['RACK_ENV'] || :development).to_sym
Bundler.require :default, environment
require './application'

run Application
