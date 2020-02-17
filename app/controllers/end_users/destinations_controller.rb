class EndUsers::DestinationsController < ApplicationController
	before_action :authenticate_end_user!
  before_action :header_login_check
  def index
  	@destination = Destination.new
  	@end_user = current_end_user
  	@destinations = @end_user.destinations.page(params[:page])
  end

  def update
  	@destination = Destination.find(params[:id])
  	  if @destination.update(destination_params)
         flash[:notice] = '配送先の更新に成功しました'
  	     redirect_to destinations_index_path
      else
         flash[:notice] = '配送先の更新に失敗しました'
         render :edit
      end
  end

  def edit
  	@destination = Destination.find(params[:id])
  end

  def destroy
  	@destination = Destination.find(params[:id])
	    if @destination.destroy
        flash[:notice] = '配送先の削除に成功しました'
      end
	    redirect_to destinations_index_path
  end

  def create
  	@destination = Destination.new(destination_params)
  	@end_user = current_end_user
    @destination.fulladdress = @destination.zipcode + @destination.address + @destination.name
  	@destination.end_user_id = current_end_user.id
    if @destination.save
      flash[:notice] = '配送先の追加に成功しました'
  	  redirect_to destinations_index_path
    else
      @destinations = @end_user.destinations.page(params[:page])
      @destination = Destination.new
      flash[:notice] = '配送先の追加に失敗しました'
      render :index
    end
  end

  private
  def destination_params
  	params.require(:destination).permit(:end_user_id,:address,:zipcode,:name)
  end
end
