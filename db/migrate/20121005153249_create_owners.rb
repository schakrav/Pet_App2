class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :city
      t.string :country
      t.string :email
      t.string :phone
      t.boolean :active

      t.timestamps
    end
  end
end
