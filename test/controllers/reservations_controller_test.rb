require 'test_helper'

class ReservationsControllerTest < ActionController::TestCase
  setup do
    @reservation = reservations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reservations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reservation" do
    assert_difference('Reservation.count') do
      post :create, reservation: { how: @reservation.how, others: @reservation.others, private: @reservation.private, sid: @reservation.sid, span_from: @reservation.span_from, span_to: @reservation.span_to, uid: @reservation.uid, what: @reservation.what, when_from: @reservation.when_from, when_to: @reservation.when_to, who: @reservation.who, with: @reservation.with }
    end

    assert_redirected_to reservation_path(assigns(:reservation))
  end

  test "should show reservation" do
    get :show, id: @reservation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reservation
    assert_response :success
  end

  test "should update reservation" do
    patch :update, id: @reservation, reservation: { how: @reservation.how, others: @reservation.others, private: @reservation.private, sid: @reservation.sid, span_from: @reservation.span_from, span_to: @reservation.span_to, uid: @reservation.uid, what: @reservation.what, when_from: @reservation.when_from, when_to: @reservation.when_to, who: @reservation.who, with: @reservation.with }
    assert_redirected_to reservation_path(assigns(:reservation))
  end

  test "should destroy reservation" do
    assert_difference('Reservation.count', -1) do
      delete :destroy, id: @reservation
    end

    assert_redirected_to reservations_path
  end
end
