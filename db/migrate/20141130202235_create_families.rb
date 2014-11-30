class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :surname
      t.string :phone_home
      t.string :phone_cell
      t.string :email
      t.string :mailing_address

      t.timestamps
    end
  end
end
