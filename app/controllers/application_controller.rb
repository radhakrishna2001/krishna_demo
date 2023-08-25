class ApplicationController < ActionController::Base
  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:email, :password, :password_confirmation, company_attributes: [:name, :owner_name,:address]])
  end

   # def after_sign_up_path_for(resource)
   #  binding.pry
   #    if resource.company
   #      #company_dashboard_path(resource.company)
   #      root_path
   #    else        
   #     super
   #    end
   #  end
end
