class Talk < ActiveRecord::Base
  belongs_to :event

  validates_presence_of :name, :event, :start_at, :end_at

end
