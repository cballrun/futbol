module TeamGroupable
  def all_team_games(team_id) 
    @games.find_all { |game| game.home_team_id == team_id || game.away_team_id == team_id }
  end

  def team_season_grouper(team_id) 
    all_games = all_team_games(team_id)
    all_games.group_by { |game| game.season }
  end
end
