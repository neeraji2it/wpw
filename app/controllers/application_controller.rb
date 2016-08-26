class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


 def is_login?
    unless current_user
      redirect_to root_path
   end
  end
  
   def layout?
    if current_user and current_user.role == 'admin'
      "admin"
    end
  end

 before_action :configure_permitted_parameters, if: :devise_controller?
  
    def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:email,:role, :first_name, :last_name, :username, :gender_type_list, :name, :address, :city, :phone, :date_of_birth,:password, :student, :password_confirmation)
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)

      if current_user.role == 'user'
         root_path()
      elsif current_user.role == 'admin'
          
        home_index_path()
       else
         root_path()
      end
   end
end
end
