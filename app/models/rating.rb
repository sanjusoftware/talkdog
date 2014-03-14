class Rating < ActiveRecord::Base
  belongs_to :talk
  belongs_to :user
  validates_presence_of :value, :time
  scope :of_user, ->(user) {where(:user => user)}

  before_save :find_interval

  def self.for_user(user)
    freq = (self.talk.end_at - self.talk.start_at) / Talk::SLOT
    where(:user => user).select("value, time").map{|value, time| [value, time/self.]}
  end
  
  private
  def find_interval
    freq = (r.talk.end_at - r.talk.start_at) / (Talk::SLOT * 60)
    self.interval = ((self.time - r.talk.start_at) / (60 * freq)).ceil
  end

end
