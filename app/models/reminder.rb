class Reminder < ApplicationRecord

  belongs_to :appointment

  enum status: [:awaiting, :sent]

  validates_uniqueness_of :minutes_before_appointment, scope: :appointment_id

  def self.send_reminders
    @reminders = Reminder.awaiting.joins(:appointment).where("date_trunc('minute', appointments.starts_at - interval '1 minute' * reminders.minutes_before_appointment) = date_trunc('minute', current_timestamp)").where("appointments.status = 1")
    @reminders.each do |r|
      ReminderMailer.with(reminder_id: r.id).reminder_email.deliver_later
    end
  end
end
