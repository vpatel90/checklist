class ListsController < ApplicationController
  skip_before_action :authenticate_user, only: [:index, :show]
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
    @list = current_user.lists.build(list_params)
    if @list.save
      redirect_to list_path(@list.id)
    else
      redirect_to(:back)
    end
  end

  def update
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path
  end

  def reset
    @list = List.find(params[:id])
    @list.tasks.update_all(status: false)
    redirect_to(:back)
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end

end
