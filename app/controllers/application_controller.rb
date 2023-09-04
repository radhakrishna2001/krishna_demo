class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def not_found_method
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end
  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:email, :password, :password_confirmation, company_attributes: [:name, :owner_name,:address]])
  end

   # def after_sign_up_path_for(resource)
   #    if resource.company
   #      #company_dashboard_path(resource.company)
   #      root_path
   #    else        
   #     super
   #    end
   #  end


   private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to dashboard_companies_path
  end

end
