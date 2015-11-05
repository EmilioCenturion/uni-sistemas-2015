class BoletaDeposito < ActiveRecord::Base
  belongs_to :cuentum
  belongs_to :apertura_caja
  has_many :boleta_deposito_detalles

  accepts_nested_attributes_for :boleta_deposito_detalles, allow_destroy: true

  before_create :bc_boleta_deposito
  after_create :ac_boleta_deposito

  protected
  	def bc_boleta_deposito
  		monto_cheque = 0
		self.boleta_deposito_detalles.each do |detalle|
			cheque = ChequeRecibido.find(detalle.cheque_recibido_id)
			monto_cheque = monto_cheque + cheque.monto
			ChequeRecibido.update(cheque, :depositado => 'true')
		end
		self.monto_cheque = monto_cheque 	
  	end
  	def ac_boleta_deposito
  		motivo_banco = MotivoMovimientoBanco.find_by(:descripcion => 'Boleta de deposito')
  		if motivo_banco.nil? 
  			motivo_banco = MotivoMovimientoBanco.create(:descripcion => 'Boleta de deposito')
  		end
  		MovimientoBanco.create(:cuenta_id => self.cuenta_id, :motivo_movimiento_banco_id => motivo_banco.id, :descripcion => "Boleta Nro: #{self.nro_boleta}", :es_ingreso => true, :monto_efectivo => self.monto_efectivo, :monto_cheque => self.monto_cheque, :fecha => Time.now)
  		motivo = MotivoMovimientoCaja.find_by(:descripcion => 'Boleta de deposito')
  		if motivo.nil? 
  			motivo = MotivoMovimientoCaja.create(:descripcion => 'Boleta de deposito')
  		end
  		cuenta = Cuentum.find(self.cuenta_id)
  		mov_caja = MovimientoCaja.create(:apertura_caja_id => self.apertura_caja_id, :motivo_movimiento_caja_id => motivo.id, :descripcion => "Boleta Nro: #{self.nro_boleta}, Cuenta Nro: #{cuenta.nro_cuenta}", :es_ingreso => false, :monto_efectivo => self.monto_efectivo, :monto_cheque => self.monto_cheque, :fecha => Time.now) 	
  	end
end
