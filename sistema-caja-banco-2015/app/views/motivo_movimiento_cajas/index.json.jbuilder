json.array!(@motivo_movimiento_cajas) do |motivo_movimiento_caja|
  json.extract! motivo_movimiento_caja, :id, :descripcion
  json.url motivo_movimiento_caja_url(motivo_movimiento_caja, format: :json)
end
