class AddSlugToTalks < ActiveRecord::Migration
  def change
    add_column :talks, :slug, :string
    add_index :talks, :slug, unique: true
  end
end
