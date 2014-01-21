class AddDifficultyToCreateTodoItems < ActiveRecord::Migration
  def change
    add_column :todo_items, :difficult, :string
  end
end
