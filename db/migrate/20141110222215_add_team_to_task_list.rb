class AddTeamToTaskList < ActiveRecord::Migration
  def change
    add_reference :task_lists, :team, index: true
  end
end
