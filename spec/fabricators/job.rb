Fabricator(:job) do
  body  Faker::Lorem.paragraph
  title Faker::Lorem.characters(255)
end
