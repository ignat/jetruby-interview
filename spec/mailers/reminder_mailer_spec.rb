require "rails_helper"

RSpec.describe ReminderMailer, type: :mailer do
  describe "send reminder" do
    let(:user) { FactoryBot.create(:user) }
    let(:appointment) { FactoryBot.create(:appointment, user: user) }
    let(:reminder) { FactoryBot.create(:reminder, appointment: appointment) }
    let(:mail) { ReminderMailer.with(reminder_id: reminder.id).reminder_email }

    it "sets headers" do
      expect(mail.subject).to eq('Reminder')
      expect(mail.to).to eq([user.email])
      expect(mail.body.encoded).to match("Your appointment titled #{appointment.title} will start")
    end

  end
end
