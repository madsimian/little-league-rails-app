class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :fname
      t.string :lname
      t.string :nickname
      t.date :birthday
      t.reference :team
      t.reference :family
      t.timestamps
    end
  end
end
