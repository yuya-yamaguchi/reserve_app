class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts
  has_many :reserve_details

  devise :trackable, :omniauthable, omniauth_providers: %i(google)

  protected
  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)
    
    unless user
      user = User.create(name:     auth.info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    auth.info.email,
                         token:    auth.credentials.token,
                         password: Devise.friendly_token[0,20])
      # binding.pry
    end
    user
  end
end
