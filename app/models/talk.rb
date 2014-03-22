class Talk < ActiveRecord::Base
  belongs_to :event
  has_and_belongs_to_many :presenters
  has_many :ratings, :dependent => :destroy

  SLOT = 6
  RATING_TO_MESSAGE =
    {'5' => 'Mesmerising',
     '4' => 'Awesome',
     '3' => 'Good',
     '2' => 'OK',
     '1' => 'Hmmm..',
     '0' => 'timepass',
     '-1' => 'Boring',
     '-2' => 'Sad',
     '-3' => "Can't Stand",
     '-4' => 'Crap',
     '-5' => 'WTF'
    }

  validates_presence_of :name, :event, :start_at, :end_at
  scope :recent, -> { where('end_at >= ?', Time.now).order('start_at')}
  scope :archieved, -> { where('end_at <= ?', Time.now).order('end_at')}

  def ratings_group
    ratings.group('value').count
  end

  def rating_groups_by_time_slot
    ratings.group('slot, value').select('count(*) as count, slot, value').order('slot asc')
  end

  def time_slots
    freq = (end_at - start_at) / (SLOT * 60)
    time_slots = []
    time_slots << start_at
    Talk::SLOT.times do |i|
      time_slots << start_at + ((i+1) * freq * 60)
    end
    time_slots
  end

  def yet_to_start?
    Time.zone.now < start_at
  end

  def ended?
    Time.zone.now > end_at
  end

  def started?
   ( Time.zone.now > start_at) && (Time.zone.now < end_at)
  end

  def positive_votes
    ratings.where('value < ? && value > ?', 5, 0).count
  end

end
