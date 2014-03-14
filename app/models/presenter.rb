class Presenter < ActiveRecord::Base
  has_and_belongs_to_many :talk
end
