class Subscribe < ApplicationRecord
    has_many :subscribe_blocks
    has_many :users, through: :subscribe_blocks
end
