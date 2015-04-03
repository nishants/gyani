require 'rubygems'
require 'bundler'

Bundler.setup

#set rack_env name
ENV['RACK_ENV'] ||= 'development'

# run app setup
require File.expand_path("../config/setup",__FILE__)

#
run Application

