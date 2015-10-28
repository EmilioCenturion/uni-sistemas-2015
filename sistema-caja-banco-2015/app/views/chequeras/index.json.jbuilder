json.array!(@chequeras) do |chequera|
  json.extract! chequera, :id, :nro_primero, :nro_ultimo, :cuentum_id, :personal_id, :estado
  json.url chequera_url(chequera, format: :json)
end
