class AddRecursoToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :cantX, :integer
    add_column :users, :cantY, :integer
    add_column :users, :cantZ, :integer
  end
end
