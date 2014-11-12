class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :ransack
  include SessionsHelper
  include UsersHelper

def ransack
	@q = User.search(params[:q])
	@users = @q.result(distinct: true)
	end
end

