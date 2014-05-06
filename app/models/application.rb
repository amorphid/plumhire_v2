class Application < ActiveRecord::Base
  # carrierwave uploader (start)
    mount_uploader :resume_url, ResumeUploader
  # carrierwave uploader (end)

  belongs_to :job

  validates(
    :email,
    presence: true,
    uniqueness: true
  )

  validates(
    :name,
    presence: true
  )

  validates(
    :resume_url,
    presence: true
  )
end
