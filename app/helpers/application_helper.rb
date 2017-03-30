module ApplicationHelper

  def show_message(message)
    message_type = ("warning" if current_user.messages.to_a.any?{|e| e.id == message.id}) || "info"
    render 'messages/message', :message_type => message_type, :message => message
  end

  def conversation_name(conversation)
     companion = conversation.users.to_a - [current_user]
    "Conversation with #{companion.first.name}"
  end
end
