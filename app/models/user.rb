class User < ApplicationRecord 

  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  attachment :profile_image
  
  validates :name, presence: true,uniqueness: true
  
  
  validates :name,length: { minimum: 2, maximum: 20 },unless: -> { name.blank? }
  validates :introduction,length: { maximum: 50 }
    
  has_many :books, dependent: :destroy
end
