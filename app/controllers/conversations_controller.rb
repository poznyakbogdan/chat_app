class ConversationsController < ApplicationController
  before_action :check_conversation, only: :create

  def index
    @conversations = current_user.conversations
  end

  def create
    # @user = User.find(get_user_id)
    @conversation = Conversation.new
    if @user.id != current_user.id
      create_conversation_for_users([current_user, @user], @conversation)
      @conversation.save
      redirect_to conversation_path @conversation
    else
      flash[:danger] = "Can't create chat with yourself"
      redirect_to users_path
    end
  end

  def show
    @conversation = Conversation.where(id: params[:id]).eager_load(:messages, :users).first
  end

  def destroy

  end

  private
  def check_conversation
    @user = User.find get_user_id
    conversation = current_user.conversations.to_a & @user.conversations.to_a
    p conversation
    redirect_to conversation_path(conversation) if conversation.any? && current_user.id != @user.id
  end

  def create_conversation_for_users(users, conversation)
    users.each do |u|
      u.conversations << conversation
    end
  end

  def get_user_id
    params[:conversation][:user_id]
  end
end
