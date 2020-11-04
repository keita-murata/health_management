User.create!(username:  "Example User",
             email: "example@health.org",
             password:              "foobar1234",
             password_confirmation: "foobar1234")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@health.org"
  password = "password"
  User.create!(username:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end