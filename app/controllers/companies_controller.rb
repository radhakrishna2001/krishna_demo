class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, only:[:show,:edit,:update,:destroy]

 
  def index
    @companys  = Company.all
  end

  def new
    @company = Company.new
  end
 
  def create
    @company = Company.create(company_params)
    if @company.save
      flash[:notice] = "company was successfully created"
    redirect_to companies_path 
    else
      render :new,  status: :unprocessable_entity 
    end
  end

  def show 
  end

  def edit
  end

  def update
    if @company.update(company_params)
    flash[:notice] = "company was seccessfully updated"
    redirect_to companies_path
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy

    @company.destroy
    flash[:notice] = "company was seccessfully deleted"
       redirect_to companies_path 
  end
  def dashboard
    @user = User.find(params[:id])
    @company = @user.company
    @products = @company.products
    @employees = @company.employees
  end


  private
     
     def set_company
      @company = Company.find(params[:id])
     end

    def company_params
      params.require(:company).permit(:name,:owner_name,:address,employees_attributes:[:name,:email,:contact])
    end
end
