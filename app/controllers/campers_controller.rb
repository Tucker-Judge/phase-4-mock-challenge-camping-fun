class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :notfound_response
rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response
    def index
        campers = Camper.all
        render json: campers
    end
    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: Camper_Activity, status: 200
    end
    def create
      camper = Camper.create!(camper_params)
      render json: camper, status: :created
       
    end


private

def unprocessable_entity_response(exception)
    render json: {errors: exception.records.errors.full_messages}, status: 422
end

def camper_params
params.permit(:name, :age)
end
def notfound_response
    render json: {errors: "Camper not found"}
end
end
