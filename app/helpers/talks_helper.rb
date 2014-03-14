module TalksHelper
  def timeline_class(talk)
    return 'success' if Time.now.between?(talk.start_at, talk.end_at)
    return 'danger' if Time.now >= talk.end_at
    'warning' if Time.now <= talk.start_at
  end

  def talk_slots(talk)
    freq = (talk.end_at - talk.start_at) / (Talk::SLOT * 60)
    time_slots = []
    time_slots << {:slot => talk.start_at, :message => Talk::DURATION[0]}
    Talk::SLOT.times do |i|
      time_slots << {:slot => talk.start_at + ((i+1) * freq * 60), :message => Talk::DURATION[i+1]}
    end
    time_slots
  end

  def rating_to_message
    {'5' => 'Mesmerising',
    '4' => 'Awesome',
    '3' => 'Good',
    '2' => 'OK',
    '1' => 'Hmmm..',
    '-1' => 'Boring',
    '-2' => 'Sad',
    '-3' => "Can't Stand",
    '-4' => 'Crap',
    '-5' => 'WTF'
    }
  end

  def rating_to_class
    {'5' => 'mesmerising',
    '4' => 'awesome',
    '3' => 'good',
    '2' => 'ok',
    '1' => 'hmmm',
    '-1' => 'boring',
    '-2' => 'sad',
    '-3' => 'cant_stand',
    '-4' => 'crap',
    '-5' => 'wtf'
    }
  end

end
