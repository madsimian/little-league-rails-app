class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :location
      t.date :date
      t.references :team

      t.timestamps
    end
  end
end
