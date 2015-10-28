json.array!(@boleta_depositos) do |boleta_deposito|
  json.extract! boleta_deposito, :id, :nro_boleta, :monto_efectivo, :monto_cheque, :fecha, :cuenta_id, :apertura_caja_id
  json.url boleta_deposito_url(boleta_deposito, format: :json)
end
