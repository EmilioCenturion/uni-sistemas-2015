require 'test_helper'

class CuponEmitidosControllerTest < ActionController::TestCase
  setup do
    @cupon_emitido = cupon_emitidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cupon_emitidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cupon_emitido" do
    assert_difference('CuponEmitido.count') do
      post :create, cupon_emitido: { concepto: @cupon_emitido.concepto, fecha: @cupon_emitido.fecha, monto: @cupon_emitido.monto, nro_cupon: @cupon_emitido.nro_cupon, proveedor_id: @cupon_emitido.proveedor_id, tarjeta_id: @cupon_emitido.tarjeta_id }
    end

    assert_redirected_to cupon_emitido_path(assigns(:cupon_emitido))
  end

  test "should show cupon_emitido" do
    get :show, id: @cupon_emitido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cupon_emitido
    assert_response :success
  end

  test "should update cupon_emitido" do
    patch :update, id: @cupon_emitido, cupon_emitido: { concepto: @cupon_emitido.concepto, fecha: @cupon_emitido.fecha, monto: @cupon_emitido.monto, nro_cupon: @cupon_emitido.nro_cupon, proveedor_id: @cupon_emitido.proveedor_id, tarjeta_id: @cupon_emitido.tarjeta_id }
    assert_redirected_to cupon_emitido_path(assigns(:cupon_emitido))
  end

  test "should destroy cupon_emitido" do
    assert_difference('CuponEmitido.count', -1) do
      delete :destroy, id: @cupon_emitido
    end

    assert_redirected_to cupon_emitidos_path
  end
end
