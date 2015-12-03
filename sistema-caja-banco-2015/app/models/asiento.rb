class Asiento < ActiveRecord::Base
  belongs_to :periodo_fiscal
  has_many :asiento_detalles
  accepts_nested_attributes_for :asiento_detalles, allow_destroy: true
end
