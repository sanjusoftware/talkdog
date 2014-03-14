module TalksHelper
  def timeline_class(talk)
    return 'success' if Time.now.between?(talk.start_at, talk.end_at)
    return 'danger' if Time.now >= talk.end_at
    'warning' if Time.now <= talk.start_at
  end

  def rating_to_message
    {'5' => "Mesmerising",
    '4' => "Mesmerising",
    '3' => "Mesmerising",
    '2' => "Mesmerising",
    '1' => "Mesmerising",
    '-1' => "Boring",
    '-2' => "Sad",
    '-3' => "Can't Stand",
    '-4' => "Crap",
    '-5' => "WTF"
    }
  end

  def rating_to_class
    {'5' => 'bar-success',
    '4' => 'bar-success',
    '3' => 'bar-success',
    '2' => 'bar-success',
    '1' => 'bar-success',
    '-1' => 'bar-danger',
    '-2' => 'bar-danger',
    '-3' => 'bar-danger',
    '-4' => 'bar-danger',
    '-5' => 'bar-danger'
    }
  end

end
