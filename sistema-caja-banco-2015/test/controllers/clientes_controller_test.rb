require 'test_helper'

class ClientesControllerTest < ActionController::TestCase
  setup do
    @cliente = clientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cliente" do
    assert_difference('Cliente.count') do
      post :create, cliente: { ciudad_id: @cliente.ciudad_id, direccion: @cliente.direccion, email: @cliente.email, nombre: @cliente.nombre, pai_id: @cliente.pai_id, representante: @cliente.representante, ruc: @cliente.ruc, telefono: @cliente.telefono }
    end

    assert_redirected_to cliente_path(assigns(:cliente))
  end

  test "should show cliente" do
    get :show, id: @cliente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cliente
    assert_response :success
  end

  test "should update cliente" do
    patch :update, id: @cliente, cliente: { ciudad_id: @cliente.ciudad_id, direccion: @cliente.direccion, email: @cliente.email, nombre: @cliente.nombre, pai_id: @cliente.pai_id, representante: @cliente.representante, ruc: @cliente.ruc, telefono: @cliente.telefono }
    assert_redirected_to cliente_path(assigns(:cliente))
  end

  test "should destroy cliente" do
    assert_difference('Cliente.count', -1) do
      delete :destroy, id: @cliente
    end

    assert_redirected_to clientes_path
  end
end
