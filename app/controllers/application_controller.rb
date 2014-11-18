class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :ransack
  before_filter :twitterfeed
  before_filter :all_users
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


  def twitterfeed
    begin
     username = current_user.twittername
    rescue
      twittername = nil
    end

    options = {:count => 10, :include_rts => true}
    begin 
      @tweets = $client.user_timeline(username, options)
    rescue
      @tweets = []
    end
  end
end

