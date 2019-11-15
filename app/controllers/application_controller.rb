class ApplicationController < ActionController::Base
  rescue_from ActionView::MissingTemplate do |exception|
    render '404'
  end
  helper_method :current_user, :is_logged?
  before_action :authorize
  
  def authorize
    redirect_to login_url, notice: "Please Sign On" unless is_logged?
  end

  def login!(user)
    s = Session.new( user_id: user.id )
    s.save
    session[:session_token] = s.session_token
  end

  def logout!(user)
    Session.sign_out_user( user )
    session[:session_token] = nil
  end

  def is_logged?
    !!current_user
  end

  def current_user
    user_id = Session.get_user_id_by_token(session[:session_token])
    return User.find( user_id ) unless user_id.nil?
  end
  
  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

end
