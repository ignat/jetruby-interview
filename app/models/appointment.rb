class Appointment < ApplicationRecord

  belongs_to :user
  has_many :reminders, dependent: :destroy

  enum status: [:pending, :confirmed, :canceled]

  validates_presence_of :title
  validates_presence_of :starts_at

end
