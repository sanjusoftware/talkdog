class AddTweetsSendToTalks < ActiveRecord::Migration
  def change
    add_column :talks, :five_tweeted, :boolean
    add_column :talks, :four_tweeted, :boolean
    add_column :talks, :three_tweeted, :boolean
    add_column :talks, :neg_five_tweeted, :boolean
  end
end
