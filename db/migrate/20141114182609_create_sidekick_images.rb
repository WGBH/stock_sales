class CreateSidekickImages < ActiveRecord::Migration
  def change
    create_table :sidekick_images do |t|

      t.timestamps
    end
  end
end
