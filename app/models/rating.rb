class Rating < ActiveRecord::Base
  belongs_to :talk
  belongs_to :user
  validates_presence_of :value
  scope :of_user, ->(user) {where(:user => user)}

  after_commit :tweet_mesmerizing, :if => :mesmerizing?
  after_commit :tweet_awesome, :if => :awesome?
  after_commit :tweet_good, :if => :good?
  after_commit :tweet_boring, :if => :boring?

  private

  def mesmerizing?
    production? && !self.talk.five_tweeted? && (self.value == 5) && rating_counter(15)
  end

  def awesome?
    production? && !self.talk.four_tweeted? && (self.value == 4) && rating_counter(30)
  end

  def good?
    production? && !self.talk.three_tweeted? && (self.value == 3) && rating_counter(30)
  end

  def boring?
    production? && !self.talk.neg_five_tweeted? && (self.value == -5) && rating_counter(30)
  end

  def production?
    Rails.env == 'production'
  end

  def rating_counter(percentage)
    Rating.where(:value => self.value, :talk_id => self.talk_id).count >  (self.talk.attendance * percentage / 100)
  end

  def tweet_mesmerizing
    message = "Claps! #{talk_name} is mesmerizing audience #{presenters_handle} #{event_handle}"
    send_tweet(message)
    self.talk.update_column(:five_tweeted, true)
  end

  def tweet_awesome
    message = "#{event_handle} Great Talk! #{talk_name} is going great #{presenters_handle}"
    send_tweet(message)
    self.talk.update_column(:four_tweeted, true)
  end

  def tweet_good
    message = "#{presenters_handle} engaging really well on #{talk_name}. Thanks to #{event_handle}"
    send_tweet(message)
    self.talk.update_column(:three_tweeted, true)
  end

  def tweet_boring
    message = "#{talk_name} #{presenters_handle} needs to add to some Indian Curry to it #{event_handle}"
    send_tweet(message)
    self.talk.update_column(:neg_five_tweeted, true)
  end

  def talk_name
    self.talk.name.truncate(35)
  end

  def presenters_handle
    self.talk.presenters.map{|p| p.twitter_handle if p.twitter_handle.present? }.compact.join(' ')
  end

  def event_handle
    '#RubyConfIndia'
  end

  def send_tweet(message)
    CLIENT.update(message)
  end

end
