#  create_table "games", force: true do |t|
#    t.string   "location"
#    t.date     "date"
#    t.integer  "team_id"
#    t.datetime "created_at"
#    t.datetime "updated_at"
#  end

class Game < ActiveRecord::Base
  has_many :matchups
  has_many :teams, :through => :matchups
  belongs_to :team
  validates :location, :date, :presence => true
end
