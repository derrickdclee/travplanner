class TraveldaysController < ApplicationController
  before_action :set_travelday, only: [:show, :edit, :update, :destroy]

  # GET /traveldays
  # GET /traveldays.json
  def index
    @traveldays = Travelday.all
  end

  # GET /traveldays/1
  # GET /traveldays/1.json
  def show
  end

  # GET /traveldays/new
  def new
    @travelday = Travelday.new
  end

  # GET /traveldays/1/edit
  def edit
  end

  # POST /traveldays
  # POST /traveldays.json
  def create
    @travelday = Travelday.new(travelday_params)

    respond_to do |format|
      if @travelday.save
        format.html { redirect_to @travelday, notice: 'Travelday was successfully created.' }
        format.json { render :show, status: :created, location: @travelday }
      else
        format.html { render :new }
        format.json { render json: @travelday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /traveldays/1
  # PATCH/PUT /traveldays/1.json
  def update
    respond_to do |format|
      if @travelday.update(travelday_params)
        format.html { redirect_to @travelday, notice: 'Travelday was successfully updated.' }
        format.json { render :show, status: :ok, location: @travelday }
      else
        format.html { render :edit }
        format.json { render json: @travelday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /traveldays/1
  # DELETE /traveldays/1.json
  def destroy
    @travelday.destroy
    respond_to do |format|
      format.html { redirect_to traveldays_url, notice: 'Travelday was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travelday
      @travelday = Travelday.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travelday_params
      params.fetch(:travelday, {})
    end
end
