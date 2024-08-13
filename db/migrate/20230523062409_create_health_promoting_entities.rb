class CreateHealthPromotingEntities < ActiveRecord::Migration[6.1]
  def change
    create_table :health_promoting_entities, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
