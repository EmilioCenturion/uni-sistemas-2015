require 'test_helper'

class MotivoMovimientoBancosControllerTest < ActionController::TestCase
  setup do
    @motivo_movimiento_banco = motivo_movimiento_bancos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:motivo_movimiento_bancos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create motivo_movimiento_banco" do
    assert_difference('MotivoMovimientoBanco.count') do
      post :create, motivo_movimiento_banco: { descripcion: @motivo_movimiento_banco.descripcion }
    end

    assert_redirected_to motivo_movimiento_banco_path(assigns(:motivo_movimiento_banco))
  end

  test "should show motivo_movimiento_banco" do
    get :show, id: @motivo_movimiento_banco
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @motivo_movimiento_banco
    assert_response :success
  end

  test "should update motivo_movimiento_banco" do
    patch :update, id: @motivo_movimiento_banco, motivo_movimiento_banco: { descripcion: @motivo_movimiento_banco.descripcion }
    assert_redirected_to motivo_movimiento_banco_path(assigns(:motivo_movimiento_banco))
  end

  test "should destroy motivo_movimiento_banco" do
    assert_difference('MotivoMovimientoBanco.count', -1) do
      delete :destroy, id: @motivo_movimiento_banco
    end

    assert_redirected_to motivo_movimiento_bancos_path
  end
end
