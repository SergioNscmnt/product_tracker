json.extract! product, :id, :name, :price, :last_scraped_at, :created_at, :updated_at
json.url category_url(product, format: :json)
