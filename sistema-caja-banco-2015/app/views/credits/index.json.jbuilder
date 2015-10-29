json.array!(@credits) do |credit|
  json.extract! credit, :id, :nro_tarjeta, :cuentum_id, :personal_id
  json.url credit_url(credit, format: :json)
end
