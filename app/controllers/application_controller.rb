class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :ransack
  before_filter :twitter
  include SessionsHelper
  include UsersHelper

  def ransack
	 @q = User.search(params[:q])
	 @users = @q.result(distinct: true)
	end


  def twitter
    username = 'lulumarshall'
    options = {:count => 10, :include_rts => true}
    @tweets = $client.user_timeline(username, options)
  end
end