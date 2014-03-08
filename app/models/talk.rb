class Talk < ActiveRecord::Base
  belongs_to :event
  has_many :presenters
  has_many :ratings, :dependent => :destroy

  validates_presence_of :name, :event, :start_at, :end_at

end
