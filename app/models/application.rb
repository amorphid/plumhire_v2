class Application < ActiveRecord::Base
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
