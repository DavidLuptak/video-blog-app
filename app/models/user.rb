class User < ActiveRecord::Base
  rolify
  acts_as_liker
  after_create :assign_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :timeoutable, :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth_hash)
    user = User.where(email: auth_hash.info.email).first
    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.new(name: auth_hash.info.name,
                      email: auth_hash.info.email,
                      uid: auth_hash.uid,
                      url: auth_hash['info']['urls']['Google'],
                      password: Devise.friendly_token[0, 20])
      user.skip_confirmation!
      user.save!
    end
    user
  end

  has_many :posts, dependent: :destroy

  def assign_default_role
    add_role :user
  end
end
