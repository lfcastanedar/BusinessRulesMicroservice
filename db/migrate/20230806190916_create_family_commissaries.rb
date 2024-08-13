class CreateFamilyCommissaries < ActiveRecord::Migration[6.1]
  def change
    create_table :family_commissaries, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
