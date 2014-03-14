RailsAdmin.config do |config|

  ### Popular gems integration

  config.main_app_name = Proc.new { |controller| [ "TalkDog", "Bark - #{controller.params[:action].try(:titleize)}" ] }

  ## == Devise ==
  config.authenticate_with do
     warden.authenticate! scope: :admin_user
  end
  config.current_user_method(&:current_admin_user)

  #config.authenticate_with do
  #  warden.authenticate! scope: :user
  #end
  #config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  config.excluded_models << "Rating"

  config.model 'User' do
    navigation_icon 'icon-user'

  end
  config.model 'AdminUser' do
    navigation_icon 'icon-eye-open'
  end

  config.model 'Event' do
    navigation_icon 'icon-bullhorn'
  end

  config.model 'Talk' do
    navigation_icon 'icon-film'
  end

  config.model 'Presenter' do
    navigation_icon 'icon-comment'
  end

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    #export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
