class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.string :description
      t.string :string
      t.string :image

      t.timestamps
    end
  end
end
