class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :surname
      t.string :phone_home
      t.string :family_phone_home
      t.string :family_phone_cell
      t.string :family_email
      t.string :family_mailing_address

      t.timestamps
    end
  end
end
