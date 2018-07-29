class ProductsGrouping
  include ActiveModel::Model
  attr_accessor :products, :new_code, :new_price, :extra_amount

  validates_presence_of :new_code, :new_price, :products
  validates_numericality_of :new_price, :extra_amount

  # Sem o setter extra_amount, o extra_amount vem como String, isso causa
  # *String can't be coerced into Float* na hora de somar o extra_amount
  # com a soma dos produtos para gerar o valor final
  def extra_amount=(extra_amount)
    @extra_amount = extra_amount.to_f
  end

  def save
    return false if invalid?
    group_products
    true
  end

  private
    def group_products
      amount = products.map(&:amount).sum # ou products.map { |p| p.amount }.sum
      amount += extra_amount
      Product.create!(
        amount: amount,
        price:  new_price,
        code:   new_code,
      )

      products.each(&:destroy)
    end
  # private end
end
