require 'test_helper'

class ChequeRecibidosControllerTest < ActionController::TestCase
  setup do
    @cheque_recibido = cheque_recibidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cheque_recibidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cheque_recibido" do
    assert_difference('ChequeRecibido.count') do
      post :create, cheque_recibido: { banco_id: @cheque_recibido.banco_id, cliente_id: @cheque_recibido.cliente_id, concepto: @cheque_recibido.concepto, fecha: @cheque_recibido.fecha, monto: @cheque_recibido.monto, nro_cheque: @cheque_recibido.nro_cheque }
    end

    assert_redirected_to cheque_recibido_path(assigns(:cheque_recibido))
  end

  test "should show cheque_recibido" do
    get :show, id: @cheque_recibido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cheque_recibido
    assert_response :success
  end

  test "should update cheque_recibido" do
    patch :update, id: @cheque_recibido, cheque_recibido: { banco_id: @cheque_recibido.banco_id, cliente_id: @cheque_recibido.cliente_id, concepto: @cheque_recibido.concepto, fecha: @cheque_recibido.fecha, monto: @cheque_recibido.monto, nro_cheque: @cheque_recibido.nro_cheque }
    assert_redirected_to cheque_recibido_path(assigns(:cheque_recibido))
  end

  test "should destroy cheque_recibido" do
    assert_difference('ChequeRecibido.count', -1) do
      delete :destroy, id: @cheque_recibido
    end

    assert_redirected_to cheque_recibidos_path
  end
end
