class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    validates :name,{presence: true}
    validates :mail,{presence: true}

    def test
        return Post.where(user_id: self.id)
        #return Post.where(user_id: self.id)
    end
end
