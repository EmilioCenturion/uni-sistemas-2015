json.array!(@cuenta) do |cuentum|
  json.extract! cuentum, :id, :nro_cuenta, :saldo, :banco_id
  json.url cuentum_url(cuentum, format: :json)
end
