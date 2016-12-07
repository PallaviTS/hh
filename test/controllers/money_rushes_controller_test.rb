require 'test_helper'

class MoneyRushesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @money_rush = money_rushes(:one)
  end

  test "should get index" do
    get money_rushes_url, as: :json
    assert_response :success
  end

  test "should create money_rush" do
    assert_difference('MoneyRush.count') do
      post money_rushes_url, params: { money_rush: { address: @money_rush.address, cash: @money_rush.cash, lat: @money_rush.lat, lng: @money_rush.lng, long_queue: @money_rush.long_queue, name: @money_rush.name, open: @money_rush.open, place_id: @money_rush.place_id, place_type: @money_rush.place_type, reported_at: @money_rush.reported_at, search_by: @money_rush.search_by } }, as: :json
    end

    assert_response 201
  end

  test "should show money_rush" do
    get money_rush_url(@money_rush), as: :json
    assert_response :success
  end

  test "should update money_rush" do
    patch money_rush_url(@money_rush), params: { money_rush: { address: @money_rush.address, cash: @money_rush.cash, lat: @money_rush.lat, lng: @money_rush.lng, long_queue: @money_rush.long_queue, name: @money_rush.name, open: @money_rush.open, place_id: @money_rush.place_id, place_type: @money_rush.place_type, reported_at: @money_rush.reported_at, search_by: @money_rush.search_by } }, as: :json
    assert_response 200
  end

  test "should destroy money_rush" do
    assert_difference('MoneyRush.count', -1) do
      delete money_rush_url(@money_rush), as: :json
    end

    assert_response 204
  end
end
