require 'test_helper'

class MovimientoBancosControllerTest < ActionController::TestCase
  setup do
    @movimiento_banco = movimiento_bancos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movimiento_bancos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movimiento_banco" do
    assert_difference('MovimientoBanco.count') do
      post :create, movimiento_banco: { cuenta_id: @movimiento_banco.cuenta_id, descripcion: @movimiento_banco.descripcion, es_ingreso: @movimiento_banco.es_ingreso, fecha: @movimiento_banco.fecha, monto_cheque: @movimiento_banco.monto_cheque, monto_efectivo: @movimiento_banco.monto_efectivo, motivo_movimiento_banco_id: @movimiento_banco.motivo_movimiento_banco_id }
    end

    assert_redirected_to movimiento_banco_path(assigns(:movimiento_banco))
  end

  test "should show movimiento_banco" do
    get :show, id: @movimiento_banco
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movimiento_banco
    assert_response :success
  end

  test "should update movimiento_banco" do
    patch :update, id: @movimiento_banco, movimiento_banco: { cuenta_id: @movimiento_banco.cuenta_id, descripcion: @movimiento_banco.descripcion, es_ingreso: @movimiento_banco.es_ingreso, fecha: @movimiento_banco.fecha, monto_cheque: @movimiento_banco.monto_cheque, monto_efectivo: @movimiento_banco.monto_efectivo, motivo_movimiento_banco_id: @movimiento_banco.motivo_movimiento_banco_id }
    assert_redirected_to movimiento_banco_path(assigns(:movimiento_banco))
  end

  test "should destroy movimiento_banco" do
    assert_difference('MovimientoBanco.count', -1) do
      delete :destroy, id: @movimiento_banco
    end

    assert_redirected_to movimiento_bancos_path
  end
end
