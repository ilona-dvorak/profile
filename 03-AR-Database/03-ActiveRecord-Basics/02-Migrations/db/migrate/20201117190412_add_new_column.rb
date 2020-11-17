class AddNewColumn < ActiveRecord::Migration[6.0]
  def change
    # TODO: your code here to create the posts table
    add_column :posts, :votes, :integer, default: 0
  end
end
