class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.reference :coach

      t.timestamps
    end
  end
end
