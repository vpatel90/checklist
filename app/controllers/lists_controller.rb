class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @tasks = @list.tasks
  end

  def new
  end
end
