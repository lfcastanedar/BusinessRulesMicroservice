class EnableUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :enabled, :boolean

    execute "UPDATE users SET enabled = true"
  end
end
