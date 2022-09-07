class ActivitiesController < ApplicationController


def index
  render json: Activity.all
end

def destroy
  activity = Activity.find(params[:id])
    activity.signups.destroy_all
    activity.destroy
    head :no_content, status: :no_content
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Activity not found" }, status: 404 
end

end
