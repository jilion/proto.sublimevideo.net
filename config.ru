require "rubygems"
require "bundler"
Bundler.require

require './proto.rb'
require 'sass/plugin/rack'

# use scss for stylesheets
Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

run Proto