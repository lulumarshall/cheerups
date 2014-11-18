class UsersController < Devise::RegistrationsController

    def index
    @q = User.search(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
      @user = User.find(params[:id])
    end

  def create
    super
    @user.role = "user"
    @user.save!
    UserMailer.registration_confirmation(@user).deliver
  end

  def edit
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
