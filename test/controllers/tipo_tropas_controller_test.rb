require 'test_helper'

class TipoTropasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_tropa = tipo_tropas(:one)
  end

  test "should get index" do
    get tipo_tropas_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_tropa_url
    assert_response :success
  end

  test "should create tipo_tropa" do
    assert_difference('TipoTropa.count') do
      post tipo_tropas_url, params: { tipo_tropa: { boni_atk: @tipo_tropa.boni_atk, boni_def: @tipo_tropa.boni_def, nombre: @tipo_tropa.nombre } }
    end

    assert_redirected_to tipo_tropa_url(TipoTropa.last)
  end

  test "should show tipo_tropa" do
    get tipo_tropa_url(@tipo_tropa)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_tropa_url(@tipo_tropa)
    assert_response :success
  end

  test "should update tipo_tropa" do
    patch tipo_tropa_url(@tipo_tropa), params: { tipo_tropa: { boni_atk: @tipo_tropa.boni_atk, boni_def: @tipo_tropa.boni_def, nombre: @tipo_tropa.nombre } }
    assert_redirected_to tipo_tropa_url(@tipo_tropa)
  end

  test "should destroy tipo_tropa" do
    assert_difference('TipoTropa.count', -1) do
      delete tipo_tropa_url(@tipo_tropa)
    end

    assert_redirected_to tipo_tropas_url
  end
end
