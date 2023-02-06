class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: render_invalid_response
    def create
        signup = Signup.create(permit_params)
        render json: signup
    end



    private

    def permit_params
        params.permit(:time, :camper, :activity)
    end
    def render_invalid_response(exception)
        render json: {errors: exception.record.errors.full_messages}, status: 422
    end
end
