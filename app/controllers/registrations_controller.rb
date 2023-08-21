# class RegistrationsController < Devise::RegistrationsController
#  def new
#     super do
#       resource.build_company
#     end
#   end

#   def create
#     super do |resource| 
#       if resource.persisted?
#         company = resource.build_company(company_params)
#         unless company.save
#           flash[:alert] = "Company registration failed"
#           resource.destroy # Delete the user if the company creation failed
#           render :new
#         end
#       end
#     else
#       redirect_to dashboard_company_path
#     end
#   end

#   private

#   def company_params
#     params.require(:company).permit(:name, :owner_name, :address)
#   end
# end
