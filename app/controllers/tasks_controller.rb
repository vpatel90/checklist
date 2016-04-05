class TasksController < ApplicationController
  def create

    @task = Task.new
    @task.body = params[:task][:body]
    @task.list_id = params[:task][:list_id]
    @list = List.find(params[:task][:list_id])
    @task.position = params[:task][:position]
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
      redirect_to(:back)
    elsif params[:value] == "incomplete"
      @task.status = false
      @task.save
      redirect_to(:back)
    elsif params[:value] == "edit"
      redirect_to list_path(@task.list_id, { activate: @task.id })
    else
      @task.body = params[:task][:body]
      if @task.save
        redirect_to list_path(@task.list_id)
      else
        flash[:alert] = @link.errors.full_messages[0]
        redirect_to(:back)
      end
    end

  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to(:back)
  end
end
