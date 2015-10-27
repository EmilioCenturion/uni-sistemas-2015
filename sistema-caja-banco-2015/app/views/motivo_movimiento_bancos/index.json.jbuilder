json.array!(@motivo_movimiento_bancos) do |motivo_movimiento_banco|
  json.extract! motivo_movimiento_banco, :id, :descripcion
  json.url motivo_movimiento_banco_url(motivo_movimiento_banco, format: :json)
end
