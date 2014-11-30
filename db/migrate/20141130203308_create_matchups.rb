class CreateMatchups < ActiveRecord::Migration
  def change
    create_table :matchups do |t|
      t.reference :team
      t.int :score
      t.string :status

      t.timestamps
    end
  end
end
