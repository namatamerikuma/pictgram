class AddTopicIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :topic_id, :integer
  end
end
