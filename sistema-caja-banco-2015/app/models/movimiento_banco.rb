
class MovimientoBanco < ActiveRecord::Base
  belongs_to :cuentum
  belongs_to :motivo_movimiento_banco
  has_many :movimiento_banco_detalles


  validates :cuenta_id, :presence => {:message => "Seleccione una cuenta"}

  validates :monto_efectivo,  :presence => {:message => "No puede estar en blanco"},
                              :length => { in: 1..30 , message: "Debe tener entre 1 y 30 caracteres"},
                              :numericality => {:only_double => true, :message => "Debe ser un numero"}

  validates :monto_cheque,  :presence => {:message => "No puede estar en blanco"},
                            :length => { in: 1..30 , message: "Debe tener entre 1 y 30 caracteres"},
                            :numericality => {:only_double => true, :message => "Debe ser un numero"}

  validate :saldo_mayor

       def saldo_mayor
        saldo = Cuentum.find(self.cuenta_id).saldo
        monto_total = monto_efectivo + monto_cheque
        errors.add(:monto_efectivo, "La suma de los montos supera el saldo que posee la cuenta") if es_ingreso == false and monto_total > saldo
      end

  before_create :crear_movimiento

  protected
  def crear_movimiento
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

