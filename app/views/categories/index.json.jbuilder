json.array!(@categories) do |category|
  json.extract! category, :name, :description, :hidden, :sort, :seo_name
  json.url category_url(category, format: :json)
end
