
class MovimientoBanco < ActiveRecord::Base
  audited
  belongs_to :cuentum
  belongs_to :motivo_movimiento_banco
  has_many :movimiento_banco_detalles


  validates :cuenta_id, :presence => {:message => "Seleccione una cuenta"}

  validates :monto_efectivo,  :presence => {:message => "No puede estar en blanco"},
                              :length => { in: 1..30 , message: "Debe tener entre 1 y 30 caracteres"},
                              :numericality => {:only_double => true, :greater_than_or_equal_to => 0, :message => "Debe ser un numero"}

  validates :monto_cheque,  :presence => {:message => "No puede estar en blanco"},
                            :length => { in: 1..30 , message: "Debe tener entre 1 y 30 caracteres"},
                            :numericality => {:only_double => true, :message => "Debe ser un numero"}

  validate :saldo_mayor

  before_create :bc_movimiento
  after_create :ac_movimiento

  def saldo_mayor
    saldo = Cuentum.find(self.cuenta_id).saldo
    monto_total = monto_efectivo + monto_cheque
    errors.add(:monto_efectivo, "La suma de los montos supera el saldo que posee la cuenta") if es_ingreso == false and monto_total > saldo
  end

  protected

  def bc_movimiento
  	self.fecha = Time.now
  	saldo = Cuentum.find(self.cuenta_id).saldo
    self.saldo_inicial = saldo
  	if self.es_ingreso
  		saldo= saldo + self.monto_efectivo + self.monto_cheque
  	else
  		saldo= saldo - self.monto_efectivo - self.monto_cheque
  	end
  	Cuentum.update(self.cuenta_id, :saldo => saldo)
  end

  def ac_movimiento
    if Asiento.last.nil? 
      nro = 1
    else
      nro = Asiento.last.nro_asiento + 1    
    end  
    periodo = PeriodoFiscal.find_by(:activo => 'true')
    cuenta = Cuentum.find(self.cuenta_id)
    banco = Banco.find(cuenta.banco_id)
    asiento = Asiento.create(nro_asiento: nro, fecha: DateTime.now, periodo_fiscal_id: periodo.id, concepto: "#{banco.nombre}, Cta. #{cuenta.nro_cuenta}, #{self.motivo_movimiento_banco.descripcion}, #{self.descripcion}")
    monto = self.monto_efectivo + self.monto_cheque
    AsientoDetalle.create(asiento_id: asiento.id, cuenta_contable_id: 8, es_credito: self.es_ingreso, importe: monto)
  end
end

