class EndUsersController < ApplicationController
	before_action :header_login_check
	def bye
		@end_user = current_end_user
	end
	def close

		@end_user = current_end_user
		@end_user.status = 0
		@end_user.save
		sign_out @end_user
		redirect_to root_path
	end
	def mypage
		@end_user = current_end_user
	end

	def update
		@end_user = current_end_user
		if @end_user.update(end_user_params)
    		redirect_to end_users_mypage_path
    	else
    		render :edit
    	end
	end

	def edit
		@end_user = current_end_user
	end
	def end_user_params
    	params.require(:end_user).permit(:lastname, :firstname, :lastname_kana, :firstname_kana, :zipcode, :address, :phone_number, :email, :status)
	end
end
