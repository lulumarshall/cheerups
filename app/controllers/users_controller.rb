class UsersController < Devise::RegistrationsController
  # before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
    def index
    # @users = User.all
    @q = User.search(params[:q])
    @users = @q.result(distinct: true)
    # @cheers = @user.cheers
  end

  def show
      @user = User.find(params[:id])
    end

  def create
    # run default version defined in Devise::RegistrationsController
    super

    # then add our custom logic
    @user.role = "user"
    @user.save!
    UserMailer.registration_confirmation(@user).deliver
  end

  def edit
    # log the ancestors of this controller
    # to confirm that we inherit from ApplicationController
    logger.info self.class.ancestors
    super
  end

  def following 
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following 
    render 'show_follow' 
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
    
  end
end
