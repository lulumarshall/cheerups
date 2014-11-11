class CheersController < ApplicationController

  skip_before_filter :verify_authenticity_token
  
  before_filter :set_cheer, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json, :js
  
  def index
    @cheers = Cheer.order(:created_at).page(params[:page]).per_page(10)    # @cheers = Cheer.all
    respond_with(@cheers)
  end

  def show
    respond_with(@cheer)
  end

  def new
    @cheer = Cheer.new
    respond_with(@cheer)
  end

  def edit
  end

  def create
    @cheer = Cheer.new(params[:cheer])
    @cheer.user_id = current_user.id
    @cheer.save
    respond_with(@cheer)
  end

  def update
    @cheer.update_attributes(params[:cheer])
    respond_with(@cheer)
  end

  def destroy
    @cheer.destroy
    respond_with(@cheer)
  end

  # cheer voting upvote and downvote
  def upvote
    @cheer = Cheer.find(params[:id])
    @cheer.upvote_by current_user
    redirect_to cheers_path
  end

  def downvote
    @cheer = Cheer.find(params[:id])
    @cheer.downvote_by current_user
    redirect_to cheers_path
  end

  private
    def set_cheer
      @cheer = Cheer.find(params[:id])
    end
end
