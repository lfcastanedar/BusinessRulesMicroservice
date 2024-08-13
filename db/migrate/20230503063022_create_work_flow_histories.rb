class CreateWorkFlowHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :work_flow_histories, id: :uuid do |t|
      t.string :address
      t.uuid :previos_step
      t.uuid :next_step
      t.text :comment
      t.string :created_by
      t.uuid :user_id

      t.timestamps
    end
  end
end
