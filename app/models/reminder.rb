class Reminder < ApplicationRecord

  belongs_to :appointment

  enum status: [:awaiting, :sent]

end
