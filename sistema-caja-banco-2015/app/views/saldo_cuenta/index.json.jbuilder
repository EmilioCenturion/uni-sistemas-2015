json.array!(@saldo_cuenta) do |saldo_cuentum|
  json.extract! saldo_cuentum, :id, :saldo_debe, :saldo_haber, :fecha, :cuenta_contable_id, :periodo_fiscal_id
  json.url saldo_cuentum_url(saldo_cuentum, format: :json)
end
