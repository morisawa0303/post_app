json.extract! image, :id, :message, :image_path, :created_at, :updated_at
json.url image_url(image, format: :json)
