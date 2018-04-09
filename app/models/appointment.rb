class Appointment < ApplicationRecord

  belongs_to :user
  has_many :reminders

  enum status: [:pending, :confirmed, :canceled]

end
