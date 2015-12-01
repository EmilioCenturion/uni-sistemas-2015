json.array!(@cuenta_contables) do |cuenta_contable|
  json.extract! cuenta_contable, :id, :tipo_cuenta, :nivel_cuenta, :codigo_cuenta, :descripcion
  json.url cuenta_contable_url(cuenta_contable, format: :json)
end
