class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :project, index: true
      t.integer :position
    end
  end
end
