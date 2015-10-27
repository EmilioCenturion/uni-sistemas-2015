class Cuentum < ActiveRecord::Base
  belongs_to :banco
  has_many :credits
  has_many :cupon_emitidos, :through => :credits
  has_many :chequeras
  has_many :cheque_emitidos, :through => :chequeras
  has_many :movimiento_bancos
  has_many :boleta_depositos


  validates :nro_cuenta, :presence => {:message => "No puede estar en blanco"},
  						 :format => { :multiline => true, with: /^([0-9]|-)*$/, message: "Solo permite numeros y guiones"}
               # :uniqueness => {:message => "Esta cuenta ya existe en la base de datos"}

  validates :banco_id, :presence => {:message => "Tienes que seleccionar un banco"}
end
