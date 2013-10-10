json.array!(@products) do |product|
  json.extract! product, :name, :description, :price, :discount, :attrs, :options, :category_id, :sku, :count, :hidden, :sort, :vendor_id, :seo_name
  json.url product_url(product, format: :json)
end
