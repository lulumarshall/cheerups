class Cheer < ActiveRecord::Base
  acts_as_votable
  attr_accessible :cheerup, :user_id
  has_many :promotes, dependent: :destroy
  belongs_to :user
  has_many :users, through: :promotes
  default_scope -> { order('created_at DESC') }

  def score
    self.get_upvotes.size - self.get_downvotes.size
  end

end
