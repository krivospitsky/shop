json.array!(@articles) do |article|
  json.extract! article, :title, :text
  json.url article_url(article, format: :json)
end
