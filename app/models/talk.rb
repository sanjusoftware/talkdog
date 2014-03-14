class Talk < ActiveRecord::Base
  belongs_to :event
  has_and_belongs_to_many :presenters
  has_many :ratings, :dependent => :destroy

  SLOT = 6

  validates_presence_of :name, :event, :start_at, :end_at
  scope :recent, -> { where('end_at >= ?', Time.now).order('start_at')}

end
