#  create_table "teams", force: true do |t|
#    t.string   "name"
#    t.integer  "coach_id"
#    t.datetime "created_at"
#    t.datetime "updated_at"
#  end

class Team < ActiveRecord::Base
  belongs_to :coach
  has_many :players
  has_many :matchups
  has_many :games, :through => :matchup
  validates :name, :coach, :presence => true
end
