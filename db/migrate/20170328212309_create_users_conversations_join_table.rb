class CreateUsersConversationsJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :conversations do |t|
      t.index :user_id
      t.index :conversation_id
    end
  end
end
