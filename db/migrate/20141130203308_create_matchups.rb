class CreateMatchups < ActiveRecord::Migration
  def change
    create_table :matchups do |t|
      t.references :team
      t.references :game
      t.integer :score
      t.integer :status

      t.timestamps
    end
  end
end
