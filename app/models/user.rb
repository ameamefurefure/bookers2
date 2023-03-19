class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   # 1:Nの関係
  has_many :books, dependent: :destroy

  has_one_attached :profile_image

  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [width, height]).processed
  end

  #バリデーション（空白は×など）を設定
  validates :name, length: { minimum: 2, maximum: 20 } #nameの文字数は、2文字から20文字まで
  validates :introduction, length: { maximum: 50 } #introductionの文字数は、50文字まで
end
