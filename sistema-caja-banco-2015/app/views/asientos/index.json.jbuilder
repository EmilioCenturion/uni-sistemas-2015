json.array!(@asientos) do |asiento|
  json.extract! asiento, :id, :nro_asiento, :fecha, :periodo_fiscal_id
  json.url asiento_url(asiento, format: :json)
end
