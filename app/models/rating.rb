class Rating < ActiveRecord::Base
  belongs_to :talk
  belongs_to :user
  validates_presence_of :value, :time
  scope :of_user, ->(user) {where(:user => user)}

  before_save :find_interval
  
  private
  def find_interval
    freq = (self.talk.end_at - self.talk.start_at) / (Talk::SLOT * 60)
    self.interval = ((self.time - self.talk.start_at) / (60 * freq)).ceil
  end

end
