class AddUserToTaskList < ActiveRecord::Migration
  def change
  	add_reference :task_lists, :user, index: true
  end
end
