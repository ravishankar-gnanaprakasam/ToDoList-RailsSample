class AddTargetCompletionDateToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :target_dt, :string
  end
end
