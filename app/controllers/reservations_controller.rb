class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    @reservations = Reservation.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @Reservation.private }
    end
  end

  # GET /reservations/new
  def new
    if signed_in?
      # 他サービスからの移行の場合
      if params['id'] && params['from']
        case params['from']
        when 'an'
          animation = Animation.find(params['id'])

          # 不正操作を弾く
          unless session[:user_uid] == animation.uid
            redirect_to '/rs/'
          end
          #hashで初期値を/rs/newに渡す
          @def_param = {'what' => animation.title, 'how' => animation.detail }
        end
      end

      @reservation = Reservation.new
    else
      redirect_to '/rs/'
    end
  end

  # GET /reservations/1/edit
  def edit
    unless session[:user_uid] == @reservation.uid
      redirect_to '/rs/'
    end
  end

  # POST /reservations
  # POST /reservations.json
  def create
    unless signed_in?
      redirect_to '/rs/'
    else
      @reservation = Reservation.new(reservation_params)
      @reservation.uid = session[:user_uid]
      @reservation.sid = session[:user_sid]

      respond_to do |format|
        if @reservation.save
          format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
          format.json { render action: 'show', status: :created, location: @reservation }
        else
          format.html { render action: 'new' }
          format.json { render json: @reservation.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:what, :how, :who, :with, :others, :when_from, :when_to, :span_from, :span_to, :private, :uid, :sid)
    end
end
