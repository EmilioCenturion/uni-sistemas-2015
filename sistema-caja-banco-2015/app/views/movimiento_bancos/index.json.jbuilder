json.array!(@movimiento_bancos) do |movimiento_banco|
  json.extract! movimiento_banco, :id, :cuenta_id, :motivo_movimiento_banco_id, :descripcion, :es_ingreso, :monto_efectivo, :monto_cheque, :fecha
  json.url movimiento_banco_url(movimiento_banco, format: :json)
end
