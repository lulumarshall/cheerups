class Cheer < ActiveRecord::Base
  attr_accessible :cheerup, :user_id
  has_many :promotes, dependent: :destroy
  belongs_to :user
  has_many :users, through: :promotes
  default_scope -> { order('created_at DESC') }
end
