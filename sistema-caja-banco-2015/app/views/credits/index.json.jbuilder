json.array!(@credits) do |credit|
  json.extract! credit, :id, :nro_tarjeta, :cuentum_id, :personal_id, :estado
  json.url credit_url(credit, format: :json)
end
