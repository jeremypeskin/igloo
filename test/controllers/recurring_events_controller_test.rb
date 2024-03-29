require 'test_helper'

class RecurringEventsControllerTest < ActionController::TestCase
  setup do
    @recurring_event = recurring_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recurring_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recurring_event" do
    assert_difference('RecurringEvent.count') do
      post :create, recurring_event: { amount: @recurring_event.amount, category: @recurring_event.category, description: @recurring_event.description }
    end

    assert_redirected_to recurring_event_path(assigns(:recurring_event))
  end

  test "should show recurring_event" do
    get :show, id: @recurring_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recurring_event
    assert_response :success
  end

  test "should update recurring_event" do
    patch :update, id: @recurring_event, recurring_event: { amount: @recurring_event.amount, category: @recurring_event.category, description: @recurring_event.description }
    assert_redirected_to recurring_event_path(assigns(:recurring_event))
  end

  test "should destroy recurring_event" do
    assert_difference('RecurringEvent.count', -1) do
      delete :destroy, id: @recurring_event
    end

    assert_redirected_to recurring_events_path
  end
end
