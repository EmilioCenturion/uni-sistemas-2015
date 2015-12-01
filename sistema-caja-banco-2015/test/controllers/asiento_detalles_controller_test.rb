require 'test_helper'

class AsientoDetallesControllerTest < ActionController::TestCase
  setup do
    @asiento_detalle = asiento_detalles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asiento_detalles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asiento_detalle" do
    assert_difference('AsientoDetalle.count') do
      post :create, asiento_detalle: { asiento_id: @asiento_detalle.asiento_id, concepto: @asiento_detalle.concepto, cuenta_contable_id: @asiento_detalle.cuenta_contable_id, es_credito: @asiento_detalle.es_credito, importe: @asiento_detalle.importe }
    end

    assert_redirected_to asiento_detalle_path(assigns(:asiento_detalle))
  end

  test "should show asiento_detalle" do
    get :show, id: @asiento_detalle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asiento_detalle
    assert_response :success
  end

  test "should update asiento_detalle" do
    patch :update, id: @asiento_detalle, asiento_detalle: { asiento_id: @asiento_detalle.asiento_id, concepto: @asiento_detalle.concepto, cuenta_contable_id: @asiento_detalle.cuenta_contable_id, es_credito: @asiento_detalle.es_credito, importe: @asiento_detalle.importe }
    assert_redirected_to asiento_detalle_path(assigns(:asiento_detalle))
  end

  test "should destroy asiento_detalle" do
    assert_difference('AsientoDetalle.count', -1) do
      delete :destroy, id: @asiento_detalle
    end

    assert_redirected_to asiento_detalles_path
  end
end
