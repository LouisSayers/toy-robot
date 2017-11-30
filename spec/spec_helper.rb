require 'rubygems'
require 'bundler'
require 'byebug'
require 'require_all'
require 'memoist'

Bundler.setup(:default, :test)

require_all 'lib'