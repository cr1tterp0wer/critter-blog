class SessionsController < ApplicationController

  # GET /sessions/new
  def new
    @session = Session.new
  end

  # POST /sessions
  # POST /sessions.json
  def create
    user = User.find_by( username: session_params[:username] )
    @session = Session.new

    if( user.try( :authenticate, session_params[:password] ) )
      @session.ensure_session_token
      puts @session.session_token
      user.session = @session
    end

    if @session.save
      session[:session_token] = @session.session_token
      redirect_to "/"
    else
      Session.errors = "Invalid Username/Password"
    end
  end


  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to sessions_url, notice: 'Session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:session).permit(:username, :password)
    end
end
