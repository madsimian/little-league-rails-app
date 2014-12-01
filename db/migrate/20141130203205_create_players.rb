class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :fname
      t.string :lname
      t.string :nickname
      t.date :birthday
      t.references :team
      t.references :family
      t.timestamps
    end
  end
end
