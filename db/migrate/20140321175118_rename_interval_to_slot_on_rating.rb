class RenameIntervalToSlotOnRating < ActiveRecord::Migration

  def change
    rename_column :ratings, :interval, :slot
    add_index :ratings, :value
    add_index :ratings, :slot
    add_index :ratings, :user_id
    add_index :ratings, :talk_id
  end

end
