class StaticController < ApplicationController

  def show
    render params[:url]
  end

  def home
    @contact_message = ContactMessage.new
  end
end
