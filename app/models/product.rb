class Product < ApplicationRecord
    attachment :image
    belongs_to :user, optional: true
    has_many :favorites
    has_many :comments, dependent: :destroy
    with_options presence: true do
        validates :title
        validates :content
        validates :tech
        validates :span
        validates :commitment
    end
end