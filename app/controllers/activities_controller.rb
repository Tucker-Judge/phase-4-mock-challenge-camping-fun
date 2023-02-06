class ActivitiesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound
    def index
        activities = Activity.all
        render json: activities
    end
    def destroy
        activity = Activity.find(params[:id])
        activity.destroy
        head :no_content
    end


    private
    def unprocessable_entity_response(exception)
        render json: {errors: exception.records.errors.full_messages}, status: 422
    end
    def record_not_found
        render json: {error: activity not found}, status: :not_found
    end
    
end
