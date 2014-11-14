class AddFieldsToSidekickImage < ActiveRecord::Migration
  def change
    change_table :sidekick_images do |t|
      t.string :title
      t.string :alt
      t.string :image
      t.string :url
      t.integer :order
    end
  end
end
