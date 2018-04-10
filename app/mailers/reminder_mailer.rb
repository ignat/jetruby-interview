class ReminderMailer < ApplicationMailer

  def reminder_email
    @reminder = Reminder.find(params[:reminder_id])
    @appointment = @reminder.appointment
    @user = @appointment.user
    mail(to: @user.email, subject: 'Reminder')
  end

end
