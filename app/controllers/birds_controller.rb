class BirdsController < ApplicationController
  before_action :find_id, only: [:show]

  def index
    birds = Bird.all
    render json: birds.to_json( only: [:id, :name, :species] )
  end

  def show
    if @bird
      render json: @bird, only: [:id, :name, :species]
    else
      render json: { message: "Bird not found" }
    end
  end

  private

  def find_id
    @bird = Bird.find_by(id: params[:id])
  end
end