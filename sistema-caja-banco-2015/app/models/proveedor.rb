class Proveedor < ActiveRecord::Base
  belongs_to :ciudad
  belongs_to :pai
  has_many :cheque_emitidos

  def name_proveedor
  	"#{nombre} - #{ruc}"
  end
end
