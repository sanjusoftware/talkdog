class AddCompanyNameAndPositionToPresenter < ActiveRecord::Migration
  def change
    add_column :presenters, :company, :string
    add_column :presenters, :position, :string
  end
end
