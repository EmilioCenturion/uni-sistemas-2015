require 'test_helper'

class LibroBancosControllerTest < ActionController::TestCase
  setup do
    @libro_banco = libro_bancos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:libro_bancos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create libro_banco" do
    assert_difference('LibroBanco.count') do
      post :create, libro_banco: { cuenta_id: @libro_banco.cuenta_id, fecha_fin: @libro_banco.fecha_fin, fecha_inicio: @libro_banco.fecha_inicio }
    end

    assert_redirected_to libro_banco_path(assigns(:libro_banco))
  end

  test "should show libro_banco" do
    get :show, id: @libro_banco
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @libro_banco
    assert_response :success
  end

  test "should update libro_banco" do
    patch :update, id: @libro_banco, libro_banco: { cuenta_id: @libro_banco.cuenta_id, fecha_fin: @libro_banco.fecha_fin, fecha_inicio: @libro_banco.fecha_inicio }
    assert_redirected_to libro_banco_path(assigns(:libro_banco))
  end

  test "should destroy libro_banco" do
    assert_difference('LibroBanco.count', -1) do
      delete :destroy, id: @libro_banco
    end

    assert_redirected_to libro_bancos_path
  end
end
