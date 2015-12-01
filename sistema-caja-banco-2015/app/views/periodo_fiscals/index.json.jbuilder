json.array!(@periodo_fiscals) do |periodo_fiscal|
  json.extract! periodo_fiscal, :id, :fecha_inicio, :fecha_fin, :anho, :activo
  json.url periodo_fiscal_url(periodo_fiscal, format: :json)
end
