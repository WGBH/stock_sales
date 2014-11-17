class AddFieldsToHeroImage < ActiveRecord::Migration
  def change
    change_table :hero_images do |t|
      t.string :title
      t.string :alt
      t.string :image
    end
  end
end
