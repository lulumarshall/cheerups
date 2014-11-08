class Promote < ActiveRecord::Base
  attr_accessible :cheer_id, :status, :user_id
  belongs_to :user
  belongs_to :cheer 
end
