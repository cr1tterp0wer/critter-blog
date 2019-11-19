class ContactMessagesController < ApplicationController
  skip_before_action :authorize, only: [:create]

  def index
    @contact_messages = ContactMessage.all
  end

  def create
    @contact_message = ContactMessage.new(contact_message_params)

    respond_to do |format|
      if @contact_message.save
        format.html { redirect_to root_url, notice: 'Message was successfully posted!' }
      else
        format.html { redirect_to root_url }
        format.json { render json: @contact_message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact_message = ContactMessage.find(params[:id])
    @contact_message.destroy
    respond_to do |format|
      format.html { redirect_to contact_messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def contact_message_params 
    params.require(:contact_message).permit(:id, :name, :email, :message)
  end
end
