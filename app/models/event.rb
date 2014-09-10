class Event < ActiveRecord::Base
  extend FriendlyId

  has_many :talks

  validates_presence_of :name, :start_at, :end_at
  scope :recent, -> { where('end_at >= ?', Time.now).order('start_at')}
  scope :archived, -> { where('end_at <= ?', Time.now).order('end_at')}

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  friendly_id :name, use: :slugged

  def yet_to_start?
    Time.zone.now < start_at
  end

  def ended?
    Time.zone.now > end_at
  end

  def started?
    ( Time.zone.now > start_at) && (Time.zone.now < end_at)
  end

end
