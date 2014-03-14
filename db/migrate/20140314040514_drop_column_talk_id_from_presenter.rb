class DropColumnTalkIdFromPresenter < ActiveRecord::Migration
  def up
    remove_column :presenters, :talk_id
  end

  def down
    add_column :presenters, :talk_id, :integer
  end
end
