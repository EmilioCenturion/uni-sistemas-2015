require 'test_helper'

class SaldoCuentaControllerTest < ActionController::TestCase
  setup do
    @saldo_cuentum = saldo_cuenta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:saldo_cuenta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create saldo_cuentum" do
    assert_difference('SaldoCuentum.count') do
      post :create, saldo_cuentum: { cuenta_contable_id: @saldo_cuentum.cuenta_contable_id, fecha: @saldo_cuentum.fecha, periodo_fiscal_id: @saldo_cuentum.periodo_fiscal_id, saldo_debe: @saldo_cuentum.saldo_debe, saldo_haber: @saldo_cuentum.saldo_haber }
    end

    assert_redirected_to saldo_cuentum_path(assigns(:saldo_cuentum))
  end

  test "should show saldo_cuentum" do
    get :show, id: @saldo_cuentum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @saldo_cuentum
    assert_response :success
  end

  test "should update saldo_cuentum" do
    patch :update, id: @saldo_cuentum, saldo_cuentum: { cuenta_contable_id: @saldo_cuentum.cuenta_contable_id, fecha: @saldo_cuentum.fecha, periodo_fiscal_id: @saldo_cuentum.periodo_fiscal_id, saldo_debe: @saldo_cuentum.saldo_debe, saldo_haber: @saldo_cuentum.saldo_haber }
    assert_redirected_to saldo_cuentum_path(assigns(:saldo_cuentum))
  end

  test "should destroy saldo_cuentum" do
    assert_difference('SaldoCuentum.count', -1) do
      delete :destroy, id: @saldo_cuentum
    end

    assert_redirected_to saldo_cuenta_path
  end
end
