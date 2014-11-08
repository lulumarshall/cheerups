class CheersController < ApplicationController
  before_filter :set_cheer, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json
  def index
    @cheers = Cheer.all
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

  private
    def set_cheer
      @cheer = Cheer.find(params[:id])
    end
end
