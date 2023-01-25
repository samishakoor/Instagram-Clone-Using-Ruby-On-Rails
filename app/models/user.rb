class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   validates :profile_type, presence: true

   followability

  has_many :posts, dependent: :delete_all
  has_many :comments
  has_many :likes
  has_many :stories

  has_one_attached :avatar


  def unfollow(user)
     followerable_relationships.where(followable_id: user.id).destroy_all
  end


     #   def randomize_id
     #     begin
     #       self.id = SecureRandom.random_number(1_000_000_000)
     #     end while User.where(id: self.id).exists?
     #   end
end
