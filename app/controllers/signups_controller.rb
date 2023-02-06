class SignupsController < ApplicationController
    def create
        signup = Signup.create(:time, :camper_id, :activity_id)
        if signup.valid?
            render json: signup
        else 
            render json: unprocessable_entity_response
        end
    
    end
end
