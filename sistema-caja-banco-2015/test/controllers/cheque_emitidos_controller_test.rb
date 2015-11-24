require 'test_helper'

class ChequeEmitidosControllerTest < ActionController::TestCase
  setup do
    @cheque_emitido = cheque_emitidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cheque_emitidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cheque_emitido" do
    assert_difference('ChequeEmitido.count') do
      post :create, cheque_emitido: { chequera_id: @cheque_emitido.chequera_id, concepto: @cheque_emitido.concepto, fecha: @cheque_emitido.fecha, monto: @cheque_emitido.monto, nro_cheque: @cheque_emitido.nro_cheque, proveedor_id: @cheque_emitido.proveedor_id }
    end

    assert_redirected_to cheque_emitido_path(assigns(:cheque_emitido))
  end

  test "should show cheque_emitido" do
    get :show, id: @cheque_emitido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cheque_emitido
    assert_response :success
  end

  test "should update cheque_emitido" do
    patch :update, id: @cheque_emitido, cheque_emitido: { chequera_id: @cheque_emitido.chequera_id, concepto: @cheque_emitido.concepto, fecha: @cheque_emitido.fecha, monto: @cheque_emitido.monto, nro_cheque: @cheque_emitido.nro_cheque, proveedor_id: @cheque_emitido.proveedor_id }
    assert_redirected_to cheque_emitido_path(assigns(:cheque_emitido))
  end

  test "should destroy cheque_emitido" do
    assert_difference('ChequeEmitido.count', -1) do
      delete :destroy, id: @cheque_emitido
    end

    assert_redirected_to cheque_emitidos_path
  end
end
