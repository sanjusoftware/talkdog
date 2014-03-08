class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :name
      t.integer :event_id
      t.text :abstract
      t.datetime :start_at
      t.datetime :end_at
      t.string :download_link
      t.integer :attendance

      t.timestamps
    end
  end
end
