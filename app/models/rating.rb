class Rating < ActiveRecord::Base
  belongs_to :talk
  belongs_to :user
  validates_presence_of :value
  scope :of_user, ->(user) {where(:user => user)}

end
