class Admins::EndUsersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@end_users = EndUser.all
	end
	def edit
		@end_user = EndUser.find(params[:id])
	end
	def update
		@end_user = EndUser.find(params[:id])
		if @end_user.update(end_user_params)
    		redirect_to admins_end_users_show_path(@end_user)
    	else
    		render :edit
    	end
	end
	def show
		@end_user = EndUser.find(params[:id])
	end
	def end_user_params
    	params.require(:end_user).permit(:lastname, :firstname, :lastname_kana, :firstname_kana, :zipcode, :address, :phone_number, :email, :status)
	end
end
