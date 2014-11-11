class ItemsController < ApplicationController
	before_action :set_task_list
	before_action :set_item, except: [:create]

	def create
		@item = @task_list.items.create(item_params)
		redirect_to @task_list
	end

	def destroy
		if @item.destroy
			flash[:sucess] = "Item Deleted"
		else
			flash[:error] = "Could not be deleted"
		end
		redirect_to @task_list
			
	end

	def complete
		@item.update_attribute(:completed_at, Time.now)
		redirect_to @task_list
	end

	private

		def item_params
			params.require(:item).permit(:content)
		end
		def set_task_list
			@task_list = TaskList.find(params[:task_list_id])
		end
		def set_item
			@item = @task_list.items.find(params[:id])
		end
end
