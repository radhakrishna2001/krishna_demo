class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_company, only:[:index,:new,:create,:show,:edit,:update,:destroy]
  before_action :set_employee,  only:[:show,:edit,:update,:destroy]

 
  def index
    @employees = @company.employees.all
  end
  
  def new 
    @employee = @company.employees.new
  end

  def create
    @employee = @company.employees.create(employee_params)
      if @employee.save
        flash[:notice] = "Employee was successfully created"
        redirect_to company_employees_path(@company)
      else
        render  :new, status: :unprocessable_entity 
      end
  end

  def show
  end

  def edit
  end

  def update
    if@employee.update(employee_params)
      flash[:notice] = "Employee was successfully update"
      redirect_to company_employee_path(@company,@employee)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy 
    @employee.destroy
    flash[:notice] = "Employee was successfully Deleted"
    redirect_to company_employees_path
  end



  private
    def set_employee 
      @employee = @company.employees.find(params[:id])
    end   
 
    def employee_params
      params.require(:employee).permit(:name,:email,:contact)
    end

    def fetch_company
      @company = Company.find(params[:company_id])
  end

end
