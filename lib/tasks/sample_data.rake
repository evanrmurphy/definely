require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Example User",
                         :email => "user@example.com",
                         :password => "foobar",
                         :password_confirmation => "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "user-#{n+1}@example.com"
      password = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end

    User.all(:limit => 6).each do |user|
      50.times do
        user.entries.create!(:word => Faker::Lorem.words(1),
                             :definition => Faker::Lorem.sentence(5))
      end
    end
  end
end
