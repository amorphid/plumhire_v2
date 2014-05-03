Fabricator(:job) do
  body  Faker::Lorem.paragraph
  title Faker::Lorem.sentence
end
