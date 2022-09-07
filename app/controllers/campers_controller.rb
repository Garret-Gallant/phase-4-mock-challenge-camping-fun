class CampersController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

def index
  render json: Camper.all
end

def show
  camper = find_camper
  render json: camper, serializer: ShowCamperSerializer
end

def create
  camper = Camper.create!(camper_params)
  render json: camper, status: 201
end

private 

def find_camper
  Camper.find(params[:id])
end

def camper_params
  params.permit(:name, :age)
end

end
