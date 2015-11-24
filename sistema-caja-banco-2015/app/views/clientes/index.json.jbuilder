json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :nombre, :representante, :ruc, :telefono, :email, :direccion, :pai_id, :ciudad_id
  json.url cliente_url(cliente, format: :json)
end
