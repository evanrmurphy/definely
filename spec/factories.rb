Factory.define :user do |user|
  user.name                  "Evan R. Murphy"
  user.email                 "evanrmurphy@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :entry do |entry|
  entry.word "foo"
  entry.definition "a thing that precedes bar"
  entry.association :user
end
