class PromotesController < ApplicationController
  # GET /promotes
  # GET /promotes.json
  def index
    @promotes = Promote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @promotes }
    end
  end

  # GET /promotes/1
  # GET /promotes/1.json
  def show
    @promote = Promote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @promote }
    end
  end

  # GET /promotes/new
  # GET /promotes/new.json
  def new
    @promote = Promote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @promote }
    end
  end

  # GET /promotes/1/edit
  def edit
    @promote = Promote.find(params[:id])
  end

  # POST /promotes
  # POST /promotes.json
  def create
    @promote = Promote.new(params[:promote])
    @promote.user_id = current_user.id
    @promote.save

    respond_to do |format|
      if @promote.save
        format.html { redirect_to @promote, notice: 'Promote was successfully created.' }
        format.json { render json: @promote, status: :created, location: @promote }
      else
        format.html { render action: "new" }
        format.json { render json: @promote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /promotes/1
  # PUT /promotes/1.json
  def update
    @promote = Promote.find(params[:id])

    respond_to do |format|
      if @promote.update_attributes(params[:promote])
        format.html { redirect_to @promote, notice: 'Promote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @promote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promotes/1
  # DELETE /promotes/1.json
  def destroy
    @promote = Promote.find(params[:id])
    @promote.destroy

    respond_to do |format|
      format.html { redirect_to promotes_url }
      format.json { head :no_content }
    end
  end
end
