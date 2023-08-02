class CompaniesController < ApplicationController
 
  def index
    @companys  = Company.all
  end

  def new
    @company = Company.new 
  end
 
  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:notice] = "company was successfully created"
    redirect_to companies_path 
    else
      render :new,  status: :unprocessable_entity 
    end
  end

  def show
    @company = Company.find(params[:id]) 
  end

  def edit

    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
    flash[:notice] = "company was seccessfully updated"
    redirect_to companies_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @company = Company.find(params[:id])
   # @company.employees.destroy
    @company.destroy
    flash[:notice] = "company was seccessfully deleted"
       redirect_to companies_path 
  end
  private
    def company_params
      params.require(:company).permit(:name,:owner_name,:address)
    end
end
