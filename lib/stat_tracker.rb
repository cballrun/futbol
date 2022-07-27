require_relative './teams'
require_relative './game'
require 'csv'

class StatTracker
  attr_reader :games,
              :teams,
              :game_teams,
              :game_path,
              :team_path,
              :game_teams_path,
              :locations

  def initialize(games, teams, game_teams)
    @game_path = './data/games.csv'
    @team_path = './data/teams.csv'
    @game_teams_path = './data/game_teams.csv'

    @locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path
      }
    @games = Game.create_multiple_games(@locations[:games])
    @teams = Teams.create_multiple_teams(@locations[:teams])
    @game_teams = GameTeams.create_multiple_game_teams(@locations[:game_teams])
  end


  def self.from_csv(locations)
    @games
    @teams
    @game_teams
    StatTracker.new(@games, @teams, @game_teams)
  end

  def highest_total_score
    score_pairs_added = []
    scores_as_pairs = @games.map do |game|
      [game.home_goals.to_i,game.away_goals.to_i]
    end
    scores_as_pairs.each do |score_pair|
      score_pairs_added << score_pair.sum
  end
     score_pairs_added.max
  end

end
