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
		flash[:notice] ='退会しました。'
		redirect_to root_path
	end
	def mypage
		@end_user = current_end_user
	end

	def password
	end

	def changed
		end_user = current_end_user
		end_user.password = params[:password]
		end_user.password_confirmation = params[:password]
		flash[:notice] = 'パスワードの変更をしました'
		end_user.save
	end
	def update
		@end_user = current_end_user
		if @end_user.update(end_user_params)
			flash[:notice] ='ユーザー情報の更新をしました'
    		redirect_to end_users_mypage_path
    	else
    		flash[:notice] ='ユーザー情報の更新に失敗しました'
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
