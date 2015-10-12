json.array!(@cupon_emitidos) do |cupon_emitido|
  json.extract! cupon_emitido, :id, :nro_cupon, :monto, :fecha, :tarjeta_id, :concepto
  json.url cupon_emitido_url(cupon_emitido, format: :json)
end
