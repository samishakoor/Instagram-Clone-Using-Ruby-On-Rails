class Post < ApplicationRecord
  has_many :comments, dependent: :delete_all
  has_many :likes , dependent: :delete_all

  validates :title ,presence: true ,length: {minimum: 5}
  validates :body ,presence: true

  has_many_attached :images

  belongs_to :user


end
