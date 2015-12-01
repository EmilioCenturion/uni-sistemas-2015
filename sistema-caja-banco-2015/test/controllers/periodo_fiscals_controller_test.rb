require 'test_helper'

class PeriodoFiscalsControllerTest < ActionController::TestCase
  setup do
    @periodo_fiscal = periodo_fiscals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:periodo_fiscals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create periodo_fiscal" do
    assert_difference('PeriodoFiscal.count') do
      post :create, periodo_fiscal: { activo: @periodo_fiscal.activo, anho: @periodo_fiscal.anho, fecha_fin: @periodo_fiscal.fecha_fin, fecha_inicio: @periodo_fiscal.fecha_inicio }
    end

    assert_redirected_to periodo_fiscal_path(assigns(:periodo_fiscal))
  end

  test "should show periodo_fiscal" do
    get :show, id: @periodo_fiscal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @periodo_fiscal
    assert_response :success
  end

  test "should update periodo_fiscal" do
    patch :update, id: @periodo_fiscal, periodo_fiscal: { activo: @periodo_fiscal.activo, anho: @periodo_fiscal.anho, fecha_fin: @periodo_fiscal.fecha_fin, fecha_inicio: @periodo_fiscal.fecha_inicio }
    assert_redirected_to periodo_fiscal_path(assigns(:periodo_fiscal))
  end

  test "should destroy periodo_fiscal" do
    assert_difference('PeriodoFiscal.count', -1) do
      delete :destroy, id: @periodo_fiscal
    end

    assert_redirected_to periodo_fiscals_path
  end
end
