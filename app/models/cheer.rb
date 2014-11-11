class Cheer < ActiveRecord::Base
  acts_as_votable
  attr_accessible :cheerup, :user_id
  has_many :promotes, dependent: :destroy
  belongs_to :user
  has_many :users, through: :promotes
  default_scope -> { order('created_at DESC') }

  def cheerup_score
    self.get_upvotes.size
  end

  def cheerdown_score
    self.get_downvotes.size
  end

  def score
    cheerup = self.get_upvotes.size
    cheerdown = self.get_downvotes.size
    cheerup - cheerdown
  end
end
