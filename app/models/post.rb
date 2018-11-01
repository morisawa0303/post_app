class Post < ApplicationRecord
    belongs_to :user

     mount_uploader :image_path, MessageImageUploader
    
    validates :content,{presence: true, length: {maximum:140}}
end
