class CreateMarmosetViewers < ActiveRecord::Migration
  def change
    create_table :marmoset_viewers do |t|
      t.references :project, index: true
      t.text :iframe_html
      t.integer :position
    end
  end
end
