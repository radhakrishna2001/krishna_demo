# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # GET /resource/sign_up
  def new
    super do 
      resource.build_company
    end
  end

  # POST /resource
    def create
      super do |resource|
        company_params = params[:user][:company_attributes]
        company = Company.new(name: company_params[:name], owner_name: company_params[:owner_name], address: company_params[:address])
        resource.company = company
        if resource.save
          company.user_ids = resource.id
          company.save
          redirect_to user_session_path and return 
        else
          render :new ,status: :unprocessable_entity and return
         end 

        #   redirect_to dashboard_companies_path(resource.company) and return 
        # if resource.company
        #   if !resource.company.save
        #     render :new , status: :unprocessable_entity and return
        #   end
        #   redirect_to dashboard_companies_path(resource.company) and return
        #   #redirect_to  new_user_session_path 
        # else 
        #   flash.now[:alert] = "Failed to save company information."
        #   render :new
        # end
       end
    end
   
  def employee_new 
    build_resource(sign_up_params)
   end

  def employee_create
    build_resource(sign_up_params)
    selected_company_id = params[:user][:company_id]
    resource.company_id = selected_company_id if selected_company_id.present?

    if resource.save
      sign_in(resource_name, resource)
      yield resource if block_given?
      redirect_to dashboard_companies_path

    else
      clean_up_passwords resource
      set_minimum_password_length
      render :employee_new ,status: :unprocessable_entity
    end
  end

  # ... other actions ...
#end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  #protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
      #def after_sign_up_path_for(resource)
  #   company_dashboard_path(resource.company)
  #    #company_path(resource.company)
         #redirect_to  new_user_session_pat
      #end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

   #  protected 
   #  def after_sign_up_path_for(resource)
   #     if resource.company
   #      #if resource.company.save
   #         binding.pry  
   #        redirect_to dashboard_company_path(resource.company) 
   #        return 
   #      #end
   #    end
   # end
end
