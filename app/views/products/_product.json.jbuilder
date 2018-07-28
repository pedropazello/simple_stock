json.extract! product, :id, :code, :price, :created_at, :updated_at
json.url product_url(product, format: :json)
