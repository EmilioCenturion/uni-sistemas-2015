require 'test_helper'

class MotivoMovimientosControllerTest < ActionController::TestCase
  setup do
    @motivo_movimiento = motivo_movimientos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:motivo_movimientos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create motivo_movimiento" do
    assert_difference('MotivoMovimiento.count') do
      post :create, motivo_movimiento: { descripcion: @motivo_movimiento.descripcion }
    end

    assert_redirected_to motivo_movimiento_path(assigns(:motivo_movimiento))
  end

  test "should show motivo_movimiento" do
    get :show, id: @motivo_movimiento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @motivo_movimiento
    assert_response :success
  end

  test "should update motivo_movimiento" do
    patch :update, id: @motivo_movimiento, motivo_movimiento: { descripcion: @motivo_movimiento.descripcion }
    assert_redirected_to motivo_movimiento_path(assigns(:motivo_movimiento))
  end

  test "should destroy motivo_movimiento" do
    assert_difference('MotivoMovimiento.count', -1) do
      delete :destroy, id: @motivo_movimiento
    end

    assert_redirected_to motivo_movimientos_path
  end
end
