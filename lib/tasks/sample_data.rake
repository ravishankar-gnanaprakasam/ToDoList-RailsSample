namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_tasks
  end
end

def make_users
  admin = User.create!(name:     "Example User",
                       email:    "todolist@railstutorial.org",
                       password: "foobar",
                       password_confirmation: "foobar")
  5.times do |n|
    name  = Faker::Name.name
    email = "todolist-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_tasks
  users = User.all(limit: 6)
  10.times do
    content = Faker::Lorem.sentence(5)
    status = "Open"
    target_dt = "09/11/1998"
    users.each { |user| user.tasks.create!(content: content, status: status, target_dt: target_dt) }
  end

  10.times do
    content = Faker::Lorem.sentence(5)
    status = "Closed"
    target_dt = "15/10/1993"
    users.each { |user| user.tasks.create!(content: content, status: status, target_dt: target_dt) }
  end
end