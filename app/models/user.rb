class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:twitter]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :description, :role, :image 
  # attr_accessible :title, :body
  has_many :cheers, dependent: :destroy
  has_many :promotes

  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy 

  has_many :following, through: :active_relationships, source: :followed 
  has_many :followers, through: :passive_relationships, source: :follower 


  
  # Follows a user.
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





