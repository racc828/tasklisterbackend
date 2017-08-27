class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  private

  def authorize_user!
    if !current_user.present?
      render json: { error: 'No user id present' }
    end
  end

  def current_user
    current_user ||= User.find_by(id: user_id)
  end

  def user_id
    decoded_token.first['id']
  end

  def decoded_token
    if token
      begin
        JWT.decode(token, "taskLister")
      rescue JWT::DecodeError
        return [{}]
      end
    else
      [{}]
    end
  end

  def token
    request.headers['Authorization']
  end
end
