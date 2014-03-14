class Talk < ActiveRecord::Base
  belongs_to :event
  has_and_belongs_to_many :presenters
  has_many :ratings, :dependent => :destroy

  SLOT = 6
  DURATION = {
      0 => "Start",
      1 => "1st Gear",
      2 => "2nd Gear",
      3 => "3rd Gear",
      4 => "4th Gear",
      5 => "Reverse",
      6 => "End",
  }

  validates_presence_of :name, :event, :start_at, :end_at
  scope :recent, -> { where('end_at >= ?', Time.now).order('start_at')}

  def ended?
    Time.zone.now > self.end_at
  end

  def started?
   ( Time.zone.now > self.start_at) && (Time.zone.now < self.end_at)
  end

end
