class CreateWorkFlowSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :work_flow_steps, id: :uuid do |t|
      t.uuid :previos_step
      t.uuid :next_step

      t.timestamps
    end

    add_reference :work_flow_steps, :model_page, type: :uuid, foreign_key: true
  end
end
