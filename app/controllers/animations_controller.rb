class AnimationsController < ApplicationController
  before_action :set_animation, only: [:show, :edit, :update, :destroy]

  # GET /animations
  # GET /animations.json
  def index
    @animations = Animation.page(params[:page]).per(3)
    respond_to do |format|
      format.html
      format.json { render :json }
    end
  end

  # GET /animations/1
  # GET /animations/1.json
  def show
    @animations = Animation.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json }
    end
  end

  # GET /animations/new
  def new
    if signed_in?
      @animation = Animation.new
    else
      redirect_to '/rs/'
    end
  end

  # GET /animations/1/edit
  def edit
    unless session[:user_uid] == @animation.uid
      redirect_to '/an/'
    end
  end

  # POST /animations
  # POST /animations.json
  def create
    unless signed_in?
      redirect_to '/an/'
    else
      @animation = Animation.new(animation_params)
      @animation.uid = session[:user_uid]
      @animation.sid = session[:user_sid]
      @animation.save

      respond_to do |format|
        if @animation.save
          format.html { redirect_to @animation, notice: 'Animation was successfully created.' }
          format.json { render action: 'show', status: :created, location: @animation }
        else
          format.html { render action: 'new' }
          format.json { render json: @animation.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /animations/1
  # PATCH/PUT /animations/1.json
  def update
    respond_to do |format|
      if @animation.update(animation_params)
        format.html { redirect_to @animation, notice: 'Animation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @animation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animations/1
  # DELETE /animations/1.json
  def destroy
    @animation.destroy
    respond_to do |format|
      format.html { redirect_to animations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animation
      @animation = Animation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def animation_params
      params.require(:animation).permit(:title, :owner, :cat, :detail, :episodes, :uid, :sid)
    end
end
