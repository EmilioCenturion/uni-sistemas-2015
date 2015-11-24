require 'test_helper'

class BoletaDepositosControllerTest < ActionController::TestCase
  setup do
    @boleta_deposito = boleta_depositos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:boleta_depositos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create boleta_deposito" do
    assert_difference('BoletaDeposito.count') do
      post :create, boleta_deposito: { apertura_caja_id: @boleta_deposito.apertura_caja_id, cuenta_id: @boleta_deposito.cuenta_id, fecha: @boleta_deposito.fecha, monto_cheque: @boleta_deposito.monto_cheque, monto_efectivo: @boleta_deposito.monto_efectivo, nro_boleta: @boleta_deposito.nro_boleta }
    end

    assert_redirected_to boleta_deposito_path(assigns(:boleta_deposito))
  end

  test "should show boleta_deposito" do
    get :show, id: @boleta_deposito
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @boleta_deposito
    assert_response :success
  end

  test "should update boleta_deposito" do
    patch :update, id: @boleta_deposito, boleta_deposito: { apertura_caja_id: @boleta_deposito.apertura_caja_id, cuenta_id: @boleta_deposito.cuenta_id, fecha: @boleta_deposito.fecha, monto_cheque: @boleta_deposito.monto_cheque, monto_efectivo: @boleta_deposito.monto_efectivo, nro_boleta: @boleta_deposito.nro_boleta }
    assert_redirected_to boleta_deposito_path(assigns(:boleta_deposito))
  end

  test "should destroy boleta_deposito" do
    assert_difference('BoletaDeposito.count', -1) do
      delete :destroy, id: @boleta_deposito
    end

    assert_redirected_to boleta_depositos_path
  end
end
