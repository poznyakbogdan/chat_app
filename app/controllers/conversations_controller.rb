class ConversationsController < ApplicationController
  before_action :compare_users

  def index
    @conversations = current_user.conversations
  end

  def create
    @conversation = Conversation.new
    @user = User.find(params[:user_id])
    if @user.id != current_user.id
      @conversation.save
      @user.conversations << @conversation
      current_user.conversations << @conversation
      redirect_to user_conversation_path(current_user, @conversation)
    else
      flash[:danger] = "Can't create chat with yourself"
      redirect_to users_path
    end
  end

  def show

  end

  def destroy

  end

  def compare_users

  end

end
