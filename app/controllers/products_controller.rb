class ProductsController < ApplicationController
before_action :fetch_company, only:[:index,:new,:create,:show,:edit,:update,:destroy]
  
  def index
    @products = @company.products.all
  end

   def new 
    @product = @company.products.new  
   end


   def create
    @product = @company.products.create(product_params)
    if @product.save
       redirect_to company_products_path(@company)
    else
      render  :new, status: :unprocessable_entity 
    end
  end

    private
    def product_params
      params.require(:product).permit(:product_name,:price)
    end

  def fetch_company
    @company = Company.find(params[:company_id])
  end
end
