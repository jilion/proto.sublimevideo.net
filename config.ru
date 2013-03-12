require "rubygems"
require "bundler"
Bundler.require

require './proto.rb'
require 'sass/plugin/rack'

# use scss for stylesheets
Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

# use coffeescript for javascript
use Rack::Coffee, root: 'public', urls: '/javascripts'

run Proto