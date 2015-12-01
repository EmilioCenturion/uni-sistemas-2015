class SaldoCuentum < ActiveRecord::Base
  belongs_to :cuenta_contable
  belongs_to :periodo_fiscal
end
