class Reminder < ApplicationRecord

  belongs_to :appointment

  enum status: [:awaiting, :sent]

  validates_uniqueness_of :when, scope: :appointment_id

  def self.send_reminders
    @reminders = Reminder.awaiting.joins(:appointment).where("date_trunc('minute', appointments.when - interval '1 minute' * reminders.when) = date_trunc('minute', current_timestamp)").where("appointments.status = 1")
    @reminders.each do |r|
      ReminderMailer.with(reminder_id: r.id).reminder_email.deliver_later
    end
  end
end
