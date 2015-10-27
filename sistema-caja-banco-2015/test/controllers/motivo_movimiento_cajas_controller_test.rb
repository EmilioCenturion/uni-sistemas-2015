require 'test_helper'

class MotivoMovimientoCajasControllerTest < ActionController::TestCase
  setup do
    @motivo_movimiento_caja = motivo_movimiento_cajas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:motivo_movimiento_cajas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create motivo_movimiento_caja" do
    assert_difference('MotivoMovimientoCaja.count') do
      post :create, motivo_movimiento_caja: { descripcion: @motivo_movimiento_caja.descripcion }
    end

    assert_redirected_to motivo_movimiento_caja_path(assigns(:motivo_movimiento_caja))
  end

  test "should show motivo_movimiento_caja" do
    get :show, id: @motivo_movimiento_caja
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @motivo_movimiento_caja
    assert_response :success
  end

  test "should update motivo_movimiento_caja" do
    patch :update, id: @motivo_movimiento_caja, motivo_movimiento_caja: { descripcion: @motivo_movimiento_caja.descripcion }
    assert_redirected_to motivo_movimiento_caja_path(assigns(:motivo_movimiento_caja))
  end

  test "should destroy motivo_movimiento_caja" do
    assert_difference('MotivoMovimientoCaja.count', -1) do
      delete :destroy, id: @motivo_movimiento_caja
    end

    assert_redirected_to motivo_movimiento_cajas_path
  end
end
