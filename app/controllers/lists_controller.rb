class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @tasks = @list.tasks
    @task = Task.new
  end

  def new
  end

  def create
  end

  def update
  end

  def delete
  end

  def reset
    @list = List.find(params[:id])
    @list.tasks.update_all(status: false)
    redirect_to(:back)
  end
end
