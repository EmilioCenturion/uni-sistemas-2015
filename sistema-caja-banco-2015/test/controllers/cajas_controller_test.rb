require 'test_helper'

class CajasControllerTest < ActionController::TestCase
  setup do
    @caja = cajas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cajas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create caja" do
    assert_difference('Caja.count') do
      post :create, caja: { estado: @caja.estado, nro_caja: @caja.nro_caja, saldo_inicial_cheque: @caja.saldo_inicial_cheque, saldo_inicial_efectivo: @caja.saldo_inicial_efectivo }
    end

    assert_redirected_to caja_path(assigns(:caja))
  end

  test "should show caja" do
    get :show, id: @caja
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @caja
    assert_response :success
  end

  test "should update caja" do
    patch :update, id: @caja, caja: { estado: @caja.estado, nro_caja: @caja.nro_caja, saldo_inicial_cheque: @caja.saldo_inicial_cheque, saldo_inicial_efectivo: @caja.saldo_inicial_efectivo }
    assert_redirected_to caja_path(assigns(:caja))
  end

  test "should destroy caja" do
    assert_difference('Caja.count', -1) do
      delete :destroy, id: @caja
    end

    assert_redirected_to cajas_path
  end
end
