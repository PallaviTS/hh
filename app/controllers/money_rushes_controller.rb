class MoneyRushesController < ApplicationController
  before_action :set_money_rush, only: [:show, :update, :destroy]

  # GET /money_rushes
  def index
    @money_rushes = MoneyRush.where(search_by: params[:search_by])
    render json: @money_rushes
  end

  # GET /money_rushes/1
  def show
    render json: @money_rush
  end

  # POST /money_rushes
  def create
    @money_rush = MoneyRush.new(money_rush_params)

    if @money_rush.save
      render json: @money_rush, status: :created, location: @money_rush
    else
      render json: @money_rush.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /money_rushes/1
  def update
    if @money_rush.update(money_rush_params.merge(reported_at: DateTime.now))
      if @money_rush.open == false || @money_rush.cash == false
        @money_rush.update_attributes(long_queue: false)
      end
      render json: @money_rush
    else
      render json: @money_rush.errors, status: :unprocessable_entity
    end
  end

  # DELETE /money_rushes/1
  def destroy
    @money_rush.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_money_rush
      @money_rush = MoneyRush.where(place_id: params[:id]).first
    end

    # Only allow a trusted parameter "white list" through.
    def money_rush_params
      params.permit(:place_type, :place_id, :address, :lat, :lng, :name, :cash, :long_queue, :open, :search_by, :reported_at)
    end
end
