module TalksHelper
  def timeline_class(talk)
    return 'success' if talk.started?
    return 'danger' if talk.ended?
    'warning' if talk.yet_to_start?
  end

  def ist(time)
    time.in_time_zone(TZInfo::Timezone.get('Asia/Kolkata'))
  end

  def talk_graph(talk)
    ratings_group = talk.ratings_group
    LazyHighCharts::HighChart.new('column') do |f|
      f.series(:name=>'Barks',:data=> ratings_group.values)
      f.title({ :text=> 'Talk Overall Performance'})
      f.options[:chart][:defaultSeriesType] = 'column'
      f.options[:xAxis] = {:plot_bands => 'none', :title=>{:text=> 'Time'}, :categories => ratings_group.keys.map{|rating| Talk::RATING_TO_MESSAGE[rating.to_s]}}
      f.options[:yAxis][:title] = {:text=> 'Barks'}
    end
  end

  def rating_to_message
    Talk::RATING_TO_MESSAGE
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
