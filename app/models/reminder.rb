class Reminder < ApplicationRecord

  belongs_to :appointment

  enum status: [:awaiting, :sent]

  validates_uniqueness_of :when, scope: :appointment_id

end
