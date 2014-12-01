#  create_table "matchups", force: true do |t|
#    t.integer  "team_id"
#    t.integer  "game_id"
#    t.integer  "score"
#    t.integer  "status"
#    t.datetime "created_at"
#    t.datetime "updated_at"
#  end

class Matchup < ActiveRecord::Base
  belongs_to :game
  belongs_to :team
  enum :status => [:home, :away]
  validates :team, :game, :status, :presence => true
end
