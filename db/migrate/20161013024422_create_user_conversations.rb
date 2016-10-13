class CreateUserConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_conversations do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :conversation, index: true, foreign_key: true

      t.timestamps
    end
    add_index :user_conversations, [:user_id, :conversation_id], unique: true
  end
end
