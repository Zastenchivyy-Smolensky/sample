class Product < ApplicationRecord
    attachment :image
    belongs_to :user, optional: true
    has_many :favorites
    with_options presence: true do
        validates :title
        validates :content
        validates :tech
        validates :span
        validates :commitment
    end

    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end