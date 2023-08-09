class EmployeesController < ApplicationController
  before_action :fetch_company, only:[:index,:new,:create,:show,:edit,:update,:destroy]  

  def index
    @employees = @company.employees.all
  end
  
  def new 
    @employee = @company.employees.new  
  end

  def create
    @employee = @company.employees.create(employee_params)
    if @employee.save
       redirect_to company_employees_path(@company)
    else
      render  :new, status: :unprocessable_entity 
    end
  end

  def show
    @employee = @company.employees.find(params[:id])
  end

  def edit
    #@company =  Company.find(params[:company_id])
    @employee = @company.employees.find(params[:id])
  end

  def update
      @employee = @company.employees.find(params[:id])
    if@employee.update(employee_params)

      redirect_to company_employee_path(@company,@employee)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy 
    @employee = @company.employees.find(params[:id])
    @employee.destroy
    redirect_to company_employees_path
  end



  private
    def employee_params
      params.require(:employee).permit(:name,:email,:contact)
    end

  def fetch_company

    @company = Company.find(params[:company_id])
  end
end
