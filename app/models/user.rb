require 'json'
require 'open-uri'

class User < ApplicationRecord
  after_create :send_welcome_email

  after_create do |user|
   SchoolChild.create
   build_profile(user)
   build_group(user)

 end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :photo, PhotoUploader
  has_one :profile, dependent: :destroy
  has_many :prestations, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :groups, dependent: :destroy, foreign_key: 'founder_id'

  devise :omniauthable, omniauth_providers: [:facebook]

  def self.find_for_facebook_oauth(auth)
      user_params = auth.slice(:provider, :uid)
      user_params.merge! auth.info.slice(:email, :first_name, :last_name, :password)
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

  def facebook_friends
    User.where(uid: facebook_uids)
  end

  def prospected_facebook_friends
    already_invited_users_ids = already_invited_users.ids
    User.where.not(id: already_invited_users_ids).where.not(id: self).where(uid: facebook_uids)
  end

  def pending_users
    User.joins(
          "JOIN group_users ON group_users.user_id = users.id
          JOIN groups ON groups.id = group_users.group_id
          ")
        .where("group_users.status='pending' AND groups.founder_id = ?  AND groups.category = 'principal'", self)
  end

  def accepted_users
    User.joins(
          "JOIN group_users ON group_users.user_id = users.id
          JOIN groups ON groups.id = group_users.group_id
          ")
        .where("group_users.status='accepted' AND groups.founder_id = ?  AND groups.category = 'principal' AND users.id <> ?", self, self)
  end

  def prospected_users
    already_invited_users_ids = already_invited_users.ids
    # Exclude the facebook friends
    # Search users not already invited with no Facebook id OR not facebook friend
    User.where(uid: nil).or(User.where.not(uid: facebook_uids)).where.not(id: already_invited_users_ids).where.not(id: self)
  end

  def already_invited_users(status = nil)
    # Return all the users having this user (self) in its group
    # whatever the status (pending or accepted)
    if (status)
      query = "members.id = ? AND groups.founder_id <> members.id AND group_users.status = '#{status}'"
    else
      query = "members.id = ? AND groups.founder_id <> members.id"
    end

    User.joins(
          "JOIN groups ON groups.founder_id = users.id
          JOIN group_users ON group_users.group_id = groups.id
          JOIN users members ON members.id = group_users.user_id
          ")
        .where(query, self)
        .distinct()
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

  def build_profile(user)
   profile=Profile.new(user: user)
   profile.save
   end

  def build_group(user)
    group = Group.new(title: "carnet d'adresse de #{user.first_name} #{user.last_name}", founder: user, category: 'principal')
    group.save
    group_user = GroupUser.new(group: group, user: user, status: "accepted")
    group_user.save
  end

  def facebook_uids
    url = "https://graph.facebook.com/me/friends?access_token=#{token}"
    begin
      user_friends_request = open(url).read
      user_friends = JSON.parse(user_friends_request)
      user_friends["data"].map do |user|
        user["id"]
      end
    rescue
      # In case of error, return an empty array
      []
    end
  end
end
