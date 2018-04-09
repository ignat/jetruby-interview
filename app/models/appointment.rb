class Appointment < ApplicationRecord

  belongs_to :user
  has_many :reminders, dependent: :destroy

  enum status: [:pending, :confirmed, :canceled]

end
