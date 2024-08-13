class AddOrderToRole < ActiveRecord::Migration[6.1]
  def change
    add_column :roles, :orden, :integer
  end
end
