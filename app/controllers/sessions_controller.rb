class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:new,:create]

  # GET /sessions/new
  def new
    @session = Session.new
    redirect_to "/" if is_logged?
  end

  # POST /sessions
  # POST /sessions.json
  def create
    user = User.find_by( username: session_params[:username] )
    @session = Session.new

    if( user.try( :authenticate, session_params[:password] ) )
      login!(user)
      redirect_to "/"
    else
      flash[:errors] = ["Invalid Username/Password"]
      render :new
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:session).permit(:username, :password)
    end
end
