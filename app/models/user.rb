class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :send_welcome_email

  has_many :orders

  ADDRESSES = []


  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

end
