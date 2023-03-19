class Book < ApplicationRecord
  belongs_to :user

  #バリデーション（空白は×など）を設定
  validates :title, presence: true #titleは空欄×
  validates :body, length: { minimum: 1, maximum: 200 } #bodyの文字数は、1文字から200文字まで
end
