json.array!(@free_ebooks) do |free_ebook|
  json.extract! free_ebook, :id, :title, :description, :status, :user_id
  json.url free_ebook_url(free_ebook, format: :json)
end
