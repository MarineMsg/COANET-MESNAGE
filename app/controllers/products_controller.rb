class ProductsController < ApplicationController
  
	before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

	def create
		@product = current_user.products.build(product_params)
    	if @product.save
      		redirect_to root_url
    	else
          @feed_items = []
      		render 'static_pages/home'
    	end
  	end

  	def destroy
      @product.destroy
      redirect_to request.referrer || root_url
  	end

    private

  	def product_params
      product.user_name = current_user.name
      params.require(:product).permit(:name_product, :date)
    end

    def correct_user
      @product = current_user.products.find_by(id: params[:id])
      redirect_to root_url if @product.nil?
    end
end
