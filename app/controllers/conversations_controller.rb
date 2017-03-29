class ConversationsController < ApplicationController
  before_action :compare_users

  def index
    @conversations = current_user.conversations
  end

  def create
    @conversation = Conversation.new
    @user = User.find(get_user_id)
    if @user.id != current_user.id
      @conversation.save
      @user.conversations << @conversation
      current_user.conversations << @conversation
      redirect_to conversation_path @conversation
    else
      flash[:danger] = "Can't create chat with yourself"
      redirect_to users_path
    end
  end

  def show
    @conversation = Conversation.where(id: params[:id]).eager_load(:messages).first
  end

  def destroy

  end

  def compare_users

  end

  def get_user_id
    params[:conversation][:user_id]
  end
end
