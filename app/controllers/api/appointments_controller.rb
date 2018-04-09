class Api::AppointmentsController < ActionController::API

  def index
    # TODO: authorize and find user
    @user = User.find(1)
    @appointments = @user.appointments
    render json: @appointments, status: :ok
  end

  def create
    # TODO: authorize and find user
    @user = User.find(1)
    @appointment = Appointment.create(params.permit(:title, :when).merge(user_id: @user.id))
    render json: @appointment, status: :ok
  end

end
