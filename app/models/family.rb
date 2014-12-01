#  create_table "families", force: true do |t|
#    t.string   "surname"
#    t.string   "phone_home"
#    t.string   "phone_cell"
#    t.string   "email"
#    t.string   "mailing_address"
#    t.datetime "created_at"
#    t.datetime "updated_at"
#  end

class Family < ActiveRecord::Base
  has_many :coaches
  has_many :players
  validates :surname, :email, :mailing_address, :presence => true
end
