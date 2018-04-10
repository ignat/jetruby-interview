class AppointmentsController < ApplicationController

  before_action :authenticate_user!

  def index
    case params[:filter]
    when 'pending'
      @appointments = current_user.appointments.pending.includes(:reminders).order(:when)
    when 'past'
      @appointments = current_user.appointments.where('"when" < now()').includes(:reminders).order(:when)
    else
      @appointments = current_user.appointments.where('"when" > now()').includes(:reminders).order(:when)
    end
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.create(params.require(:appointment).permit(:title, :when, :status).merge(user_id: current_user.id))
    flash[:notice] = "Successfully created a new appointment"
    redirect_to appointments_url
  end

  def edit
    @appointment = Appointment.where(id: params[:id], user_id: current_user.id).first
  end

  def update
    @appointment = Appointment.where(id: params[:id], user_id: current_user.id).first
    @appointment.update(params.require(:appointment).permit(:title, :when, :status))
    flash[:notice] = "Successfully updated the appointment"
    redirect_to appointments_url
  end

  def destroy
    @appointment = Appointment.where(id: params[:id], user_id: current_user.id).first
    @appointment.delete
    flash[:notice] = "Successfully deleted the appointment"
    redirect_to appointments_url
  end

end
