class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.string :orig_format
      t.string :tape_id
      t.string :series
      t.string :program
      t.string :date_portrayed
      t.string :event_loc
      t.string :c_title
      t.string :desc
      t.string :keywords
      t.string :category
      t.string :start_tc
      t.string :end_tc
      t.string :duration
      t.string :broadcast_format
      t.timestamps
    end
  end
end
