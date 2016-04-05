class ListsApiController < ApplicationController
  def index
    render json: List.all
  end

  def show
    render json: List.find(params[:id])
  end

  def show_tasks
    render json: List.find(params[:id]).tasks
  end
end
