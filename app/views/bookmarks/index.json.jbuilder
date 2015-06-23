json.array!(@bookmarks) do |bookmark|
  json.extract! bookmark, :id, :string, :user_id, :topic_id
  json.url bookmark_url(bookmark, format: :json)
end
