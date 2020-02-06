class EndUsersController < ApplicationController
	def mypage
		@end_user = current_end_user
	end
end
