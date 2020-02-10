class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  def header_login_check
    if admin_signed_in?
      @header_login_name = "admin"
    else
      if end_user_signed_in?
        @header_login_name = "#{current_end_user.lastname}#{current_end_user.firstname}"
      end
    end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:lastname, :firstname, :lastname_kana, :firstname_kana, :zipcode, :address, :phone_number, :status])
    end

  def after_sign_in_path_for(resource)
  	case resource
  		when EndUser
  			@end_user = resource
  			if @end_user.status
  				case resource
  					when Admin
    					admins_root_path
 					when EndUser
    					root_path
  					end
    		else
    			sign_out @end_user
      			flash[:error] = "このアカウントは退会済みです"
      			root_path
  			end
  		when Admin
  			case resource
  				when Admin
    				admins_root_path
 				when EndUser
    				root_path
  			end
  		end
  	end

  def after_sign_out_path_for(resource)
  	case resource
  	when :admin
    	admins_root_path
 	when :end_user
    	root_path
  	end
  end
end
