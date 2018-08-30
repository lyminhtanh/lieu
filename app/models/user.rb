class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include Spree::UserMethods
  include Spree::UserAddress
  include Spree::UserPaymentSource
  include Spree::UserApiAuthentication
  after_create :set_admin

  private
  def set_admin
    if  User.count == 1
      User.first.update_attribute(:admin, true)
    else
      return true
    end
  end
end
