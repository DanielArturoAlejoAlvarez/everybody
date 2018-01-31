class Post < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true

    extend FriendlyId
    friendly_id :title, use: :slugged

    def should_generate_new_friendly_id?
        title_changed?
    end
    
end
