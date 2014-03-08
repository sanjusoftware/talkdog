class Event < ActiveRecord::Base
  has_many :talks

  validates_presence_of :name, :start_at, :end_at
end
