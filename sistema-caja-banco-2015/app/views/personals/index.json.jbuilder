json.array!(@personals) do |personal|
  json.extract! personal, :id, :nombre, :documento, :telefono, :email, :direccion, :pai_id, :ciudad_id
  json.url personal_url(personal, format: :json)
end
