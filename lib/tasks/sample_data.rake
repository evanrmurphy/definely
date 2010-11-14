require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:name => "Example User",
                 :email => "user@example.com")
    99.times do |n|
      name  = Faker::Name.name
      email = "user-#{n+1}@example.com"
      User.create!(:name => name,
                   :email => email)
    end

    User.all(:limit => 6).each do |user|
      50.times do
        user.entries.create!(:word => Faker::Lorem.words(1),
                             :definition => Faker::Lorem.sentence(5))
      end
    end
  end
end
