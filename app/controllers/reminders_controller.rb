class RemindersController < ApplicationController

  before_action :authenticate_user!

  def new
    @appointment = Appointment.where(id: params[:appointment_id], user_id: current_user.id).first
    @reminder = Reminder.new(appointment_id: @appointment.id)
  end

  def create
    @appointment = Appointment.where(id: params[:appointment_id], user_id: current_user.id).first
    @reminder = Reminder.new(params.require(:reminder).permit(:when))
    @reminder.appointment = @appointment
    @reminder.save
    flash[:notice] = "Successfully added a new reminder"
    redirect_to appointments_url
  end

  def destroy
    @reminder = Reminder.find(params[:id])
    @reminder.delete
    redirect_to appointments_url
  end

end
