class Appointment < ApplicationRecord

  belongs_to :user

  enum status: [:pending, :confirmed, :canceled]

end
