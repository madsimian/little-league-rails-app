class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :location
      t.date :date
      t.reference :team

      t.timestamps
    end
  end
end
