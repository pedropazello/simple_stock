require 'test_helper'

class ProductsGroupingTest < ActiveSupport::TestCase
  test "should agrup all products in one product" do
    product1 = create(:product, amount: 10.0)
    product2 = create(:product, amount: 20.0)
    product3 = create(:product, amount: 30.0)

    products_grouping_form = ProductsGrouping.new(
      products: [product1, product2, product3],
      new_code: "test",
      new_price: 50.0,
      extra_amount: 10,
    )

    products_grouping_form.save
    assert_equal 1,      Product.count
    assert_equal "test", Product.first.code
    assert_equal 50.0,   Product.first.price
    assert_equal 70.0,   Product.first.amount
  end

  test "when new_code is blank should return a error" do
    product1 = create(:product, amount: 10.0)
    product2 = create(:product, amount: 20.0)
    product3 = create(:product, amount: 30.0)

    products_grouping_form = ProductsGrouping.new(
      products: [product1, product2, product3],
      new_code: nil,
      new_price: 50.0,
    )

    assert_not products_grouping_form.save
    assert_equal [:new_code, "can't be blank"], products_grouping_form.errors.first
  end

  test "when new_price is blank should return a error" do
    product1 = create(:product, amount: 10.0)
    product2 = create(:product, amount: 20.0)
    product3 = create(:product, amount: 30.0)

    products_grouping_form = ProductsGrouping.new(
      products: [product1, product2, product3],
      new_code: "abc123",
      new_price: nil,
    )

    assert_not products_grouping_form.save
    assert_equal [:new_price, "can't be blank"], products_grouping_form.errors.first
  end

  test "when new_price is not a number should return a error" do
    product1 = create(:product, amount: 10.0)
    product2 = create(:product, amount: 20.0)
    product3 = create(:product, amount: 30.0)

    products_grouping_form = ProductsGrouping.new(
      products: [product1, product2, product3],
      new_code: "abc123",
      new_price: "abc",
    )

    assert_not products_grouping_form.save
    assert_equal [:new_price, "is not a number"], products_grouping_form.errors.first
  end
end
