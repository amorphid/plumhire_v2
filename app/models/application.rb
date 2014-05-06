class Application < ActiveRecord::Base
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
    presence: true,
    uniqueness: true
  )
end
