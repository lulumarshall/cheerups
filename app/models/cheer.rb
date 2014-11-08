class Cheer < ActiveRecord::Base
  attr_accessible :cheerup, :user_id
  has_many :promotes
  has_many :users, through: :promotes
end
