class Blog < ApplicationRecord
    validates :title, :content, :image_path, presence: true
end
