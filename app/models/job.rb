class Job < ActiveRecord::Base
  has_many :applications

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
