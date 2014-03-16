class DropColumnTimeFromRating < ActiveRecord::Migration
  def up
    remove_column :ratings, :time
  end

  def down
    add_column :ratings, :time, :datetime
  end
end
