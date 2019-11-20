class AddPostToTask < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :post, null: false
  end
end
