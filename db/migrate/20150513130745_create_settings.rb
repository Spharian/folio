class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.attachment :cv
    end
  end
end
