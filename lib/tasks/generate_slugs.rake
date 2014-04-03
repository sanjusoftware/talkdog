namespace :generate do
  namespace :slugs do
    desc "Create slugs for existing events"
    task :events => :environment do
      Event.find_each(&:save)
    end

    desc "Create slugs for existing talks"
    task :talks => :environment do
      Talk.find_each(&:save)
    end
  end
end