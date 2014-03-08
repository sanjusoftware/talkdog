class CreatePresenters < ActiveRecord::Migration
  def change
    create_table :presenters do |t|
      t.string :name
      t.text :bio
      t.string :twitter_handle
      t.string :email
      t.integer :talk_id

      t.timestamps
    end
  end
end
