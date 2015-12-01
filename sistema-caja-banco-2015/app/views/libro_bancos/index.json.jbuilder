json.array!(@libro_bancos) do |libro_banco|
  json.extract! libro_banco, :id, :cuenta_id, :fecha_inicio, :fecha_fin
  json.url libro_banco_url(libro_banco, format: :json)
end
