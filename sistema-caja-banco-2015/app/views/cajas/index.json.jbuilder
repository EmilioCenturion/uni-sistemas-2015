json.array!(@cajas) do |caja|
  json.extract! caja, :id, :nro_caja, :saldo_inicial_efectivo, :saldo_inicial_cheque, :estado
  json.url caja_url(caja, format: :json)
end
