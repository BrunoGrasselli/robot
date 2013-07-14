require 'bundler'

ENV['GAME_ENV'] ||= 'development'

Bundler.setup
Bundler.require :default, ENV['GAME_ENV']

['../app/models', '../app/controllers'].each do |dir|
  Dir[File.expand_path("../#{dir}/*.rb", __FILE__)].each { |file| require file }
end
