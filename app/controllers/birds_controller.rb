class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds.to_json(except:
        [:created_at, :updated_by]) 
        # the above is being used to explicity render in JSON and to show that except and only are actually parameters of the .to_json method.
      # birds, only: 
      # [:id, :name, :species]
      # except: 
      # [:created_at, :updated_at]
  end

  def show
    bird = Bird.find_by(id:params[:id])
    if bird
      render json: {id: bird.id, name: bird.name, species: bird.species}
    # bird.slice(:id, :name, :species)
    else
      render json: { message: 'Bird not found' }
    end
  end
end