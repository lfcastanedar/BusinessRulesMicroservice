class CreatePageControlTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :page_control_types, id: :uuid do |t|
      t.string :name
      
      t.timestamps
    end
  end
end
