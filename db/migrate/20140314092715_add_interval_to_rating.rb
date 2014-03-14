class AddIntervalToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :interval, :integer
  end
end
