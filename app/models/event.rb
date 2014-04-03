class Event < ActiveRecord::Base
  extend FriendlyId

  has_many :talks

  validates_presence_of :name, :start_at, :end_at
  scope :recent, -> { where('end_at >= ?', Time.now).order('start_at')}

  friendly_id :name, use: :slugged
end
