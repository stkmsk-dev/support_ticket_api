class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do
    render json: { error: "Not Found" }, status: 404
  end
  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: 422
  end
end
