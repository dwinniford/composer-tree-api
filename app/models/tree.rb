class Tree < ApplicationRecord
    has_many :notes, dependent: :destroy 
    belongs_to :user
    # without the dependent option tree.notes.delete all will default to nullify. note tree_id is set to null and note is not deleted.
end
