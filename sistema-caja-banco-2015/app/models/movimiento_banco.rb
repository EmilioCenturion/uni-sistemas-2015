
class MovimientoBanco < ActiveRecord::Base
  audited
  belongs_to :cuentum
  belongs_to :motivo_movimiento_banco
  has_many :movimiento_banco_detalles


  validates :cuenta_id, :presence => {:message => "Seleccione una cuenta"}

  validates :monto_efectivo,  :presence => {:message => "No puede estar en blanco"},
                              :length => { in: 1..10 , message: "Debe tener entre 1 y 10 caracteres"},
                              :numericality => {:only_double => true, :greater_than_or_equal_to => 0, :message => "Debe ser un numero"}

  validates :monto_cheque,  :presence => {:message => "No puede estar en blanco"},
                            :length => { in: 1..10 , message: "Debe tener entre 1 y 10 caracteres"},
                            :numericality => {:only_double => true, :message => "Debe ser un numero"}

  validate :saldo_mayor

  before_create :bc_movimiento

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

end

