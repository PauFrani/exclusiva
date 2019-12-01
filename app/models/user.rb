class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :biddings
  has_many :purchases, through: :biddings
  has_one :address, as: :addressable

  #scope :today_biddings, -> { biddings.where('bidding.created_at > ?', Time.now.midnight)}

  after_create :send_welcome_email
  user = User.first
  UserMailer.with(user: user).welcome.deliver_now

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end
end
