class EndUsers::DestinationsController < ApplicationController
	before_action :authenticate_end_user!
  def index
  	@destination = Destination.new
  	@end_user = current_end_user
  	@destinations = @end_user.destinations.page(params[:page])
  end

  def update
  	@destination = Destination.find(params[:id])
  	@destination.update(destination_params)
  	redirect_to destinations_index_path
  end

  def edit
  	@destination = Destination.find(params[:id])
  end

  def destroy
  	@destination = Destination.find(params[:id])
	@destination.destroy
	redirect_to destinations_index_path
  end

  def create
  	@destination = Destination.new(destination_params)
  	@destination.end_user_id = current_end_user.id
  	@destination.save
  	redirect_to destinations_index_path
  end

  private
  def destination_params
  	params.require(:destination).permit(:end_user_id,:address,:zipcode,:name)
  end
end
