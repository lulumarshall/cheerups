class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:twitter]
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :description, :twittername, :role, :image, :background_image
  mount_uploader :background_image, BackgroundImageUploader
  has_many :cheers, dependent: :destroy
  has_many :promotes
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy 
  has_many :following, through: :active_relationships, source: :followed 
  has_many :followers, through: :passive_relationships, source: :follower 
 
  # Follows a user.
  def user_name=(name)
  user = User.find_by_name(name)
    if user
      self.user_id = user.id
    else
      errors[:user_name] << "Invalid name entered"
    end
  end

  def user_name
    User.find(user_id).name if user_id
  end

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    userd = Relationship.where(followed_id: other_user.id).first 
    userd.destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  def self.find_for_twitter(auth, signed_in_user=nil)
    twitter_email = auth.info.nickname.downcase + "@twitter.com"
    if user = signed_in_user || User.find_by_email(twitter_email)
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.name if user.username.blank?
      user.image = auth.info.image if user.image.blank?
      user.save
      user
    else
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.username = auth.info.name
        user.email = twitter_email
        user.image = auth.info.image
        user.password = Devise.friendly_token[0,20]
        # user.skip_confirmation! # don't require email confirmation
      end
    end
  end

end





