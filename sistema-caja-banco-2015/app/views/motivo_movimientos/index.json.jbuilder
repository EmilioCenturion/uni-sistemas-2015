json.array!(@motivo_movimientos) do |motivo_movimiento|
  json.extract! motivo_movimiento, :id, :descripcion
  json.url motivo_movimiento_url(motivo_movimiento, format: :json)
end
