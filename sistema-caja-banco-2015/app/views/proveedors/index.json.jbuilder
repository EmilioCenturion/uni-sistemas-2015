json.array!(@proveedors) do |proveedor|
  json.extract! proveedor, :id, :nombre, :representante, :ruc, :direccion, :telefono, :ciudad_id, :pai_id
  json.url proveedor_url(proveedor, format: :json)
end
