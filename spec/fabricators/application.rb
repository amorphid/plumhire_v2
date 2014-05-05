Fabricator(:application) do
  email      Faker::Internet.email
  name       Faker::Name.name
  resume_url Faker::Internet.url
end
