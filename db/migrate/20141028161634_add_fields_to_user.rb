class AddFieldsToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :phone
      t.string :fax
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
    end
  end
end
