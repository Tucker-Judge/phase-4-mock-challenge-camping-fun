class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response
    def index
        render json: Camper.all
    end
    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperWithActivitiesSerializer
    end
    def create
        camper = Camper.create(permit_params)
        render json: camper
    end



    private
    def render_not_found_response
        render json: {error: 'Camper Not Found'}, status: :not_found
    end
    def permit_params
        params.permit(:name, :age)
    end
    def render_invalid_response(exception)
        render json: {error: exception.record.errors.full_messages}, status: 422
    end
end
