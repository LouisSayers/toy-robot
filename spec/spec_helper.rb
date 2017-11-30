require 'rubygems'
require 'bundler'
require 'byebug'
require 'require_all'

Bundler.setup(:default, :test)

require_all 'lib'