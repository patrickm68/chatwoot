class AddCreatedByToMessage < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :created_by, :string, default: nil
  end
end
