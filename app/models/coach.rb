#  create_table "coaches", force: true do |t|
#    t.string   "fname"
#    t.string   "lname"
#    t.date     "birthday"
#    t.integer  "family_id"
#    t.datetime "created_at"
#    t.datetime "updated_at"
#  end


class Coach < ActiveRecord::Base
  has_one :team
  belongs_to :family
  validates :fname, :lname, :birthday, :presence => true
end
