class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :ransack
  before_filter :twitter 
  # before_filter :twitterstream
  include SessionsHelper
  include UsersHelper

  def ransack
	 @q = User.search(params[:q])
	 @users = @q.result(distinct: true)
	end


  def twitter
    username = 'iandenty'
    options = {:count => 10, :include_rts => true}
     @tweets = $client.user_timeline(username, options)
    # @tweets = $client.friends(username)
    # @tweets = client.search("#ruby -rt", lang: "ja").first.text
  end

  # def twitterstream
  #   topics = ["coffee", "tea"]
  #   @tweetstream = $clients.filter(track: topics.join(",")) 
  # end
end

