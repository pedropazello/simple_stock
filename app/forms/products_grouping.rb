class ProductsGrouping
  include ActiveModel::Model
  attr_accessor :products, :new_code, :new_price

  validates_presence_of :new_code, :new_price
  validates_numericality_of :new_price

  def save
    return false if invalid?
    group_products
    true
  end

  private
    def group_products
      amount = products.map(&:amount).sum # ou products.map { |p| p.amount }.sum
      Product.create!(
        amount: amount,
        price:  new_price,
        code:   new_code,
      )

      products.each(&:destroy)
    end
  # private end
end
