class Book < ApplicationRecord
  
  belongs_to :user 
  
  
validates :title, presence: { message: "can't be blank" }
  validates :body, presence: { message: "can't be blank" }

  # 最小文字数を検証（ただし、空ではない場合のみ）
  validates :title, length: { minimum: 2}, unless: -> { title.blank? }
  validates :body, length: { minimum: 2, maximum:200 }, unless: -> { body.blank? }

end