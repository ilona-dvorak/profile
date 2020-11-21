class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.integer :votes, default: 0
      t.timestamps null: false
      t.references :user, foregin_key: true, null: false
    end
  end
end
