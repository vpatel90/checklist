class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @tasks = @list.tasks.order(position: :asc)
    @task = Task.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new
    @list.name = params[:list][:name]
    if @list.save
      redirect_to list_path(@list.id)
    else
      redirect_to(:back)
    end
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
