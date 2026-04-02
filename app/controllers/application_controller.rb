class ApplicationController < ActionController::API
  before_action :authenticate_user!

  def authenticate_user!
    token = request.headers["Authorization"]&.split(" ")&.last
    @current_user = User.find_by(api_token: token)

    render json: { error: "Unauthorized" }, status: :unauthorized unless @current_user
  end

  def current_user
    @current_user
  end

  rescue_from ActiveRecord::RecordNotFound do
    render json: { error: "Not Found" }, status: 404
  end
  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: 422
  end
end
