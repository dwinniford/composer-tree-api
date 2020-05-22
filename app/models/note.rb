class Note < ApplicationRecord
    belongs_to :tree 
    validates :title, presence: true 
    has_one_attached :audio_file 
end
