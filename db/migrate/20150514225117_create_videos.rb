class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.references :project, index: true
      t.string :video_link
      t.integer :position
    end
  end
end
