json.array!(@movimiento_cajas) do |movimiento_caja|
  json.extract! movimiento_caja, :id, :apertura_caja_id, :motivo_movimiento_caja_id, :descripcion, :es_ingreso, :monto_efectivo, :monto_cheque, :fecha
  json.url movimiento_caja_url(movimiento_caja, format: :json)
end
