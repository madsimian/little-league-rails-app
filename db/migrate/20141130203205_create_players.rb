class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :player_fname
      t.string :player_lname
      t.string :player_nickname
      t.date :player_birthday
      t.reference :team

      t.timestamps
    end
  end
end
