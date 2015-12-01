class AsientoDetalle < ActiveRecord::Base
  belongs_to :asiento
  belongs_to :cuenta_contable
end
