json.array!(@cheque_recibidos) do |cheque_recibido|
  json.extract! cheque_recibido, :id, :nro_cheque, :banco_id, :monto, :fecha, :concepto, :cliente_id
  json.url cheque_recibido_url(cheque_recibido, format: :json)
end
