class ContactMessagesController < ApplicationController
    
  def create
    @contact_message = ContactMessage.new(contact_message_params)

    respond_to do |format|
      if @contact_message.save
        format.html { redirect_to "/", notice: 'Message was successfully posted!' }
        format.json { render :show, status: :created, location: "static#home" }
      else
        format.html { redirect_to "/" }
        format.json { render json: @contact_message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

  def contact_message_params 
    params.require(:contact_message).permit(:name, :email, :message)
  end
end
