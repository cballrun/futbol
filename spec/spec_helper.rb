require 'simplecov'
SimpleCov.start
#any test files we create must require relative in this spot, if we make a test file we will list it here
require_relative 'teams_spec'
require_relative 'game_teams_spec'
require_relative 'stat_tracker_spec'