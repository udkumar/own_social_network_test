class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #devise :database_authenticatable, :registerable, :confirmable,
   # :recoverable, :rememberable, :trackable, :validatable
    has_many :friends
    has_many :subscribe_blocks
    has_many :subscribe, through: :subscribe_blocks
end
