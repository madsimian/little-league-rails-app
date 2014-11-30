class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.string :fname
      t.string :lname
      t.date :birthday
      t.reference :family

      t.timestamps
    end
  end
end
