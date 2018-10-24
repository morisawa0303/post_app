class User < ApplicationRecord
    has_secure_password

    has_many :posts, dependent: :destroy
    validates :name,{presence: true}
    validates :mail,{presence: true}
    validates :password,{presence: true}

    def test
        return Post.where(user_id: self.id)
    end
end
