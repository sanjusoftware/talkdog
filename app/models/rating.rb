class Rating < ActiveRecord::Base
  belongs_to :talk

  validates_presence_of :value, :time
end
