class Job < ActiveRecord::Base
  validates(
    :body,
    presence: true
  )

  validates(
    :title,
    length: { maximum: 255 },
    presence: true
  )
end
