json.array!(@cajas) do |caja|
  json.extract! caja, :id, :nro_caja, :apertura, :cierre, :saldo_inicial_efectivo, :saldo_inicial_cheque, :saldo_final_efectivo, :saldo_final_cheque, :usuario_id
  json.url caja_url(caja, format: :json)
end
