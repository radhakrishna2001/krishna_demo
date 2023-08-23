class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_company, only:[:index,:new,:create,:show,:edit,:update,:destroy]
  before_action :set_product, only:[:show,:edit,:update,:destroy]
  
  def index
    @products = @company.products.all
  end

  def new 
    @product = @company.products.new  
  end

  def create
    @product = @company.products.create(product_params)
    if @product.save
      flash[:notice] = "product was successfully created"
      redirect_to company_products_path(@company)
    else
      render  :new, status: :unprocessable_entity 
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "product was successfully update"
      redirect_to company_product_path(@company,@product)
    else
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy
    @product.destroy
    flash[:notice] = "product was successfully Deleted"
    redirect_to company_products_path
  end

  private
  def set_product
    @product = @company.products.find(params[:id])
  end   

  def product_params
    params.require(:product).permit(:product_name,:price)
  end

  def fetch_company
    @company = Company.find(params[:company_id])
  end
end
