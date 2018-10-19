class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    validates :name,{presence: true}
    validates :mail,{presence: true}
end
