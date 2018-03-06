class User < ApplicationRecord
  after_create :send_welcome_email
  after_create do |user|
   build_group(user)
 end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :photo, PhotoUploader
  has_many :prestations, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :groups, dependent: :destroy, foreign_key: 'founder_id'


  devise :omniauthable, omniauth_providers: [:facebook]



  def self.find_for_facebook_oauth(auth)
      user_params = auth.slice(:provider, :uid)
      user_params.merge! auth.info.slice(:email, :first_name, :last_name, :password, :user_friends)
      user_params[:facebook_picture_url] = auth.info.image
      user_params[:token] = auth.credentials.token
      user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
      user_params = user_params.to_h

      user = User.find_by(provider: auth.provider, uid: auth.uid)
      user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
      if user
        user.update(user_params)
      else
        user = User.new(user_params)
        user.password = Devise.friendly_token[0,20]  # Fake password for validation
        user.save
      end

      return user
  end


  private

    def send_welcome_email
      UserMailer.welcome(self).deliver_now
    end

def build_group(user)

     group=Group.new(title: "carnet d'adresse de #{user.email}", founder: user)
     group.users << user
     group.save
  end

end
