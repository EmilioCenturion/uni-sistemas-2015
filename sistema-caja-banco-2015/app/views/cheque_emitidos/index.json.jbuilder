json.array!(@cheque_emitidos) do |cheque_emitido|
  json.extract! cheque_emitido, :id, :nro_cheque, :monto, :fecha, :chequera_id, :proveedor_id, :concepto
  json.url cheque_emitido_url(cheque_emitido, format: :json)
end
