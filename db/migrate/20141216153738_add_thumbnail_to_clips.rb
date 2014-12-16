class AddThumbnailToClips < ActiveRecord::Migration
  def change
    add_column :clips, :thumb, :string
  end
end
