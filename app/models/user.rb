class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, UserImageUploader


  has_many :prototypes
  has_many :comments
  # has_many :captured_images, through: :prototypes

  has_many :prototypes, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_prototypes, through: :likes, source: :prototypes


  validates :name, presence: true
end
