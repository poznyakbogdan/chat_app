class MessagesController < ApplicationController

  def create
    @message = current_user.messages.new message_params
    if @message.save
      # flash[:success] = "Successfully send!"
      # redirect_to conversation_path params[:conversation_id]
    else
      flash[:danger] = "Cant send!"
      redirect_to conversation_path params[:conversation_id]
    end
  end

  private

  def message_params
    params.permit(:conversation_id, :body)
  end
end
