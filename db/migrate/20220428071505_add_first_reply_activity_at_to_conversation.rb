class AddFirstReplyActivityAtToConversation < ActiveRecord::Migration[6.1]
  def change
    add_column :conversations, :first_reply_created_at, :datetime, default: nil
    add_index :conversations, :first_reply_created_at

    add_first_reply_activity_at_to_conversations
  end

  private

  def add_first_reply_activity_at_to_conversations
    ::Conversation.find_in_batches do |conversation_batch|
      Rails.logger.info "Migrated till #{conversation_batch.first.id}\n"
      conversation_batch.each do |conversation|
        # rubocop:disable Rails/SkipsModelValidations
        if conversation.messages.outgoing.count.positive?
          conversation.update_columns(first_reply_created_at: conversation.messages.outgoing.first.created_at)
        end
        # rubocop:enable Rails/SkipsModelValidations
      end
    end
  end
end
