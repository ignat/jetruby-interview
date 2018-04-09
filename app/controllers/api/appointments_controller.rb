class Api::AppointmentsController < ActionController::API

  def index
    # TODO: authorize and find user
    @user = User.find(1)
    # TODO: filter by date
    @appointments = @user.appointments
    render json: @appointments, status: :ok
  end

  def create
    # TODO: authorize and find user
    @user = User.find(1)
    @appointment = Appointment.create(params.permit(:title, :when).merge(user_id: @user.id, status: :pending))
    render json: @appointment, status: :created
  end

end
