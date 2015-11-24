require 'test_helper'

class MovimientoCajasControllerTest < ActionController::TestCase
  setup do
    @movimiento_caja = movimiento_cajas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movimiento_cajas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movimiento_caja" do
    assert_difference('MovimientoCaja.count') do
      post :create, movimiento_caja: { apertura_caja_id: @movimiento_caja.apertura_caja_id, descripcion: @movimiento_caja.descripcion, es_ingreso: @movimiento_caja.es_ingreso, fecha: @movimiento_caja.fecha, monto_cheque: @movimiento_caja.monto_cheque, monto_efectivo: @movimiento_caja.monto_efectivo, motivo_movimiento_caja_id: @movimiento_caja.motivo_movimiento_caja_id }
    end

    assert_redirected_to movimiento_caja_path(assigns(:movimiento_caja))
  end

  test "should show movimiento_caja" do
    get :show, id: @movimiento_caja
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movimiento_caja
    assert_response :success
  end

  test "should update movimiento_caja" do
    patch :update, id: @movimiento_caja, movimiento_caja: { apertura_caja_id: @movimiento_caja.apertura_caja_id, descripcion: @movimiento_caja.descripcion, es_ingreso: @movimiento_caja.es_ingreso, fecha: @movimiento_caja.fecha, monto_cheque: @movimiento_caja.monto_cheque, monto_efectivo: @movimiento_caja.monto_efectivo, motivo_movimiento_caja_id: @movimiento_caja.motivo_movimiento_caja_id }
    assert_redirected_to movimiento_caja_path(assigns(:movimiento_caja))
  end

  test "should destroy movimiento_caja" do
    assert_difference('MovimientoCaja.count', -1) do
      delete :destroy, id: @movimiento_caja
    end

    assert_redirected_to movimiento_cajas_path
  end
end
