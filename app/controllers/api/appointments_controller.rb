class Api::AppointmentsController < ActionController::API

  def index
    api_key = request.headers['Authorization']
    return head :unauthorized if api_key.blank?
    @user = User.find_by_api_key(api_key)
    return head :unauthorized if @user.nil?
    if params[:date].present?
      @appointments = @user.appointments.where(["date(\"when\") = ?", params[:date]])
    else
      @appointments = @user.appointments
    end
    render json: @appointments, status: :ok
  end

  def create
    api_key = request.headers['Authorization']
    return head :unauthorized if api_key.blank?
    @user = User.find_by_api_key(api_key)
    return head :unauthorized if @user.nil?
    @appointment = Appointment.create(params.permit(:title, :when).merge(user_id: @user.id, status: :pending))
    if params[:reminder].present?
      @appointment.reminders.create(when: params[:reminder])
    end
    render json: @appointment, status: :created
  end

end
