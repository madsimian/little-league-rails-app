# create_table "players", force: true do |t|
#   t.string   "fname"
#   t.string   "lname"
#   t.string   "nickname"
#   t.date     "birthday"
#   t.integer  "team_id"
#   t.integer  "family_id"
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end

class Player < ActiveRecord::Base
  belongs_to :family
  belongs_to :team
  validates :team, :family, :fname, :lname, :birthday, :presence => true
end
