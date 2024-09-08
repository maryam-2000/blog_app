class ApplicationController < ActionController::API
  before_action :authenticate_request, except: [:signup, :login]

  private

  def authenticate_request
    header = request.headers['Authorization']
    
    if header.present?
      token = header.split(' ').last
      begin
        decoded = JsonWebToken.decode(token)
        @current_user = User.find(decoded[:user_id]) if decoded
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'User not found' }, status: :unauthorized
      rescue JsonWebToken::DecodeError
        render json: { error: 'Invalid token' }, status: :unauthorized
      rescue StandardError => e
        render json: { error: 'Internal server error', details: e.message }, status: :internal_server_error
      end
    else
      render json: { error: 'Token missing' }, status: :unauthorized
    end
  end
end
