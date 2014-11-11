class Item < ActiveRecord::Base
  belongs_to :task_list

  def completed?
  	!completed_at.blank?
  end

end
