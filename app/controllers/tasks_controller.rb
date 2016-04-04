class TasksController < ApplicationController
  def create

    @task = Task.new
    @task.body = params[:task][:body]
    @task.list_id = params[:task][:list_id]
    @list = List.find(params[:task][:list_id])
    @task.position = @list.tasks.count + 1
    if @task.save
      redirect_to(:back)
    else
      flash[:alert] = @link.errors.full_messages[0]
      redirect_to(:back)
    end
  end

  def update
    @task = Task.find(params[:id])
    if params[:value] == "complete"
      @task.status = true
      @task.save
    elsif params[:value] == "incomplete"
      @task.status = false
      @task.save
    end
    redirect_to(:back)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to(:back)
  end
end
