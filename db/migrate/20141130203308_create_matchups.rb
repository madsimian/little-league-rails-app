class CreateMatchups < ActiveRecord::Migration
  def change
    create_table :matchups do |t|
      t.reference :team
      t.reference :game
      t.int :score
      t.int :status

      t.timestamps
    end
  end
end
