class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :biddings
  has_one :address, as: :addressable

  #scope :today_biddings, -> { biddings.where('bidding.created_at > ?', Time.now.midnight)}
end
