class Api::ListsController < ApplicationController
  skip_before_action :authenticate_user
  def index
    render json: List.all
  end

  def show
    render json: List.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end

  def create
    list = List.create!(name: params[:name])
    render json: list
  rescue ActiveRecord::RecordInvalid
    render json: { message: "Invalid Input", status: 400 }, status: 400
  end

  def update
    list = List.find(params[:id])
    list.update(name: params[:name])
    render json: list
  rescue ActiveRecord::RecordInvalid
    render json: { message: "Invalid Input", status: 400 }, status: 400
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404

  end

  def destroy
    list = List.find(params[:id])
    list.destroy
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end
end
