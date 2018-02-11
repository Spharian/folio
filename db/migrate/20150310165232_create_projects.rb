class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.text :text
      t.integer :position
      t.references :category, index: true

      t.timestamps null: false
    end
  end
end
