class CreatePresentersTalks < ActiveRecord::Migration
  def change
    create_table :presenters_talks do |t|
      t.belongs_to :talk
      t.belongs_to :presenter
    end
  end
end
