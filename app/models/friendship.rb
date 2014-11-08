class Friendship < ActiveRecord::Base
  attr_accessible :friend_id, :friend_status, :user_id
end
