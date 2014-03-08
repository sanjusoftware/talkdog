class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :value
      t.datetime :time
      t.integer :talk_id

      t.timestamps
    end
  end
end
