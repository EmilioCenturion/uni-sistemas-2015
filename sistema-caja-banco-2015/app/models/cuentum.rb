class Cuentum < ActiveRecord::Base
  audited
  belongs_to :banco
  has_many :credits
  has_many :cupon_emitidos, :through => :credits
  has_many :chequeras
  has_many :cheque_emitidos, :through => :chequeras
  has_many :movimiento_bancos
  has_many :boleta_depositos
  


  validates :nro_cuenta, :presence => {:message => "No puede estar en blanco"},
                         :numericality => {:only_integer => true, :greater_than => 0, :message => "Debe ser un numero"},
               :uniqueness => { :scope => :banco_id, message: "Esta cuenta ya existe en la base de datos" }


  validates :banco_id, :presence => {:message => "Tienes que seleccionar un banco"}

  before_destroy :bd_puede_eliminar
  
  protected

  def bd_puede_eliminar
    Credit.where(:cuentum_id => self.id).empty? and Chequera.where(:cuentum_id => self.id).empty? and MovimientoBanco.where(:cuenta_id => self.id).empty?
  end

end
