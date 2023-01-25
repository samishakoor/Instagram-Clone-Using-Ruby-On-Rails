class Story < ApplicationRecord


  validates :body ,presence: true ,length: {minimum: 5}

  has_one_attached :image

  belongs_to :user



end
