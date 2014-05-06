Fabricator(:application) do
  email      Faker::Internet.email
  name       Faker::Name.name
  resume_url {
    Rack::Test::UploadedFile.new(
      "./spec/support/files/hey_look_a_pdf_pdf_lolz.pdf",
      "application/pdf"
    )
  }
end
