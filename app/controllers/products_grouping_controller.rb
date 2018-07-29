class ProductsGroupingController < ApplicationController
  def new
    @products_grouping = ProductsGrouping.new(products: products)
  end

  def create
    @products_grouping = ProductsGrouping.new(products_grouping_params)
    @products_grouping.products = products

    if @products_grouping.save
      redirect_to products_path, notice: 'Products Grouping was successfully created.'
    else
      render :new
    end
  end

  private
    def products
      Product.where(id: params[:selected_products])
    end

    def products_grouping_params
      params.require(:products_grouping).permit(:new_price, :new_code,
        :products, :extra_amount)
    end
  # private end
end
