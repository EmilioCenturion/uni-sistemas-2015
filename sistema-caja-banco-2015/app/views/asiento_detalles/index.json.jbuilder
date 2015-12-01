json.array!(@asiento_detalles) do |asiento_detalle|
  json.extract! asiento_detalle, :id, :asiento_id, :cuenta_contable_id, :importe, :es_credito, :concepto
  json.url asiento_detalle_url(asiento_detalle, format: :json)
end
