json.extract! publication, :id, :title, :description, :status, :created_at, :updated_at
json.url publication_url(publication, format: :json)
