json.array!(@configuracions) do |configuracion|
  json.extract! configuracion, :id, :nombre_empresa, :direccion, :correo, :telefono, :logo_empresa, :cabecera_impresion, :tiempo_espera
  json.url configuracion_url(configuracion, format: :json)
end
