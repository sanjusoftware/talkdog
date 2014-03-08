class Talk < ActiveRecord::Base
  belongs_to :event
  has_many :presenters

  validates_presence_of :name, :event, :start_at, :end_at

end
