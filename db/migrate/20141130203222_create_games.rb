class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :game_location
      t.date :game_date
      t.reference :team

      t.timestamps
    end
  end
end
