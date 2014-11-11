class TaskListsController < ApplicationController
  before_action :set_task_list, only: [:show, :edit, :update, :destroy]

  def index
    @task_lists = current_user.task_lists.all
  end

  def show
    @task_list = current_user.task_lists.find(params[:id])
    @items = @task_list.items
  end

  def edit
  end

  def create
    @task_list = current_user.task_lists.build(task_list_params)

      if @task_list.save
        flash[:sucess] = "New Task List created!"
        redirect_to current_user
      else
        flash[:danger] = "One or more required fields are empty."
        redirect_to current_user
      end
  end

  def update
    respond_to do |format|
      if @task_list.update(task_list_params)
        format.html { redirect_to @task_list, notice: 'Task list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_lists/1
  # DELETE /task_lists/1.json
  def destroy
    @task_list.destroy
    respond_to do |format|
      format.html { redirect_to task_lists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_list
      @task_list = current_user.task_lists.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_list_params
      params.require(:task_list).permit(:title, :description)
    end
end
