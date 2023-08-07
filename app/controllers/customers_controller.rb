class CustomersController < ApplicationController
  def new
    @companies = Company.all
    # com = Company.find(params[:id])
    @customer = Customer.new
    # customer = com.customers.new
  end

  def create

    # @customer = Customer.new(customer_params)    
    company = Company.find(params[:customer][:comapnies_ids])
  
    @customer = Customer.new(customer_params)
    if @customer.save
      company.customers << @customer
      redirect_to customers_path
    else
      @companies = Company.all
      render :new, status: :unprocessable_entity
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :contact)
   #@customer.company_ids = params[:customer][:company_ids]
  end
end

#@customer.company_ids = params[:customer][:company_ids]
