class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :ransack
  before_filter :twitter
  before_filter :all_users
  # before_filter :twitterstream
  include SessionsHelper
  include UsersHelper

  def all_users

    @users = User.all
    @user  = current_user
  end

  def ransack
	 @q = User.search(params[:q])
	 @users = @q.result(distinct: true)
	end


  def twitter
    # unless current_user
      begin
       username = current_user.username
      rescue
        username = nil
      end

      options = {:count => 10, :include_rts => true}
      begin 
        @tweets = $client.user_timeline(username, options)
      rescue
        @tweets = []
      end
    # end
    # @tweets = $client.friends(username)
    # @tweets = client.search("#ruby -rt", lang: "ja").first.text
  end

  # def twitterstream
  #   topics = ["coffee", "tea"]
  #   @tweetstream = $clients.filter(track: topics.join(",")) 
  # end
end

