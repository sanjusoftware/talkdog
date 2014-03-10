module TalksHelper
  def timeline_class(talk)
    return 'success' if Time.now.between?(talk.start_at, talk.end_at)
    return 'danger' if Time.now >= talk.end_at
    'warning' if Time.now <= talk.start_at
  end
end
