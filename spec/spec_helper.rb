ENV['GAME_ENV'] = 'test'

require "./config/boot"

Dir["./spec/support/**/*.rb"].each { |file| require file }

