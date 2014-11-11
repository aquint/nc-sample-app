class TaskList < ActiveRecord::Base
	has_many :items
end
