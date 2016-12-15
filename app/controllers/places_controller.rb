class PlacesController < ApplicationController
  def index
    data = MoneyRush.pluck(:search_by).uniq.map{ |d| {place_name: d} }
    render json: data.to_json
  end
end
