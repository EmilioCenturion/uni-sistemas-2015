class BoletaDeposito < ActiveRecord::Base
  audited
  belongs_to :cuentum
  belongs_to :apertura_caja
  has_many :boleta_deposito_detalles

  validates :cuenta_id, :presence => {:message => "Seleccione una cuenta"}

  validates :nro_boleta, :presence => {:message => "No puede estar en blanco"},
                         :numericality => {:only_double => true, :greater_than_or_equal_to => 0, :message => "Debe ser un numero"},
            
                         :uniqueness => {:message => "Esta boleta ya existe" }
                         
  validates :monto_efectivo,  :presence => {:message => "No puede estar en blanco"},
                         :numericality => {:only_double => true, :greater_than_or_equal_to => 0, :message => "Debe ser un numero"}
                      

  accepts_nested_attributes_for :boleta_deposito_detalles, allow_destroy: true



  before_create :bc_boleta_deposito
  after_create :ac_boleta_deposito

  validate :no_cero

    def no_cero
    errors.add(:monto_efectivo, "No puede ser cero") if cheques_vacio? and monto_efectivo == 0
  end

  def cheques_vacio?
    boleta_deposito_detalles.empty?
  end

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
  		mov_banco = MovimientoBanco.create(:cuenta_id => self.cuenta_id, :motivo_movimiento_banco_id => motivo_banco.id, :descripcion => "Boleta Nro: #{self.nro_boleta}", :es_ingreso => true, :monto_efectivo => self.monto_efectivo, :monto_cheque => self.monto_cheque, :fecha => Time.now)
  		self.boleta_deposito_detalles.each do |detalle|
        MovimientoBancoDetalle.create(:movimiento_banco_id => mov_banco.id, :cheque_recibido_id => detalle.cheque_recibido_id)
      end

      motivo = MotivoMovimientoCaja.find_by(:descripcion => 'Boleta de deposito')
  		if motivo.nil? 
  			motivo = MotivoMovimientoCaja.create(:descripcion => 'Boleta de deposito')
  		end
  		cuenta = Cuentum.find(self.cuenta_id)
  		MovimientoCaja.create(:apertura_caja_id => self.apertura_caja_id, :motivo_movimiento_caja_id => motivo.id, :descripcion => "Boleta Nro: #{self.nro_boleta}, Cuenta Nro: #{cuenta.nro_cuenta}", :es_ingreso => false, :monto_efectivo => self.monto_efectivo, :monto_cheque => self.monto_cheque, :fecha => Time.now) 	
      
      #para asientos automáticos, sale caja y entra banco
      if Asiento.last.nil? 
        nro = 1
      else
        nro = Asiento.last.nro_asiento + 1    
      end  
      periodo = PeriodoFiscal.find_by(:activo => 'true')
      cuenta = Cuentum.find(self.cuenta_id)
      banco = Banco.find(cuenta.banco_id)
      asiento = Asiento.create(nro_asiento: nro, fecha: DateTime.now, periodo_fiscal_id: periodo.id)
      monto = self.monto_efectivo + self.monto_cheque
      apertura = self.apertura_caja
      #sale caja
      AsientoDetalle.create(asiento_id: asiento.id, cuenta_contable_id: 5, es_credito: 'false', importe: monto, concepto: "Nro. #{apertura.caja.nro_caja}, Deposito Nro. #{self.nro_boleta}")
      #entra banco
      AsientoDetalle.create(asiento_id: asiento.id, cuenta_contable_id: 8, es_credito: 'true', importe: monto, concepto: "#{banco.nombre}, Cta. #{cuenta.nro_cuenta}, Deposito Nro. #{self.nro_boleta}")
      
  	end
end
