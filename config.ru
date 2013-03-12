require 'rubygems'
require 'bundler'
Bundler.require

require './proto.rb'
require 'sass/plugin/rack'

if ENV['RACK_ENV'] == 'production'
  use Rack::Auth::Basic, 'Private' do |u, p|
    [u, p] == ['jilion', ENV['PRIVATE_CODE']]
  end
end

# use scss for stylesheets
Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

# use coffeescript for javascript
use Rack::Coffee, root: 'public', urls: '/javascripts'

run Proto