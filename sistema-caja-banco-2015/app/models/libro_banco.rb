class LibroBanco < ActiveRecord::Base
  belongs_to :cuenta

  validates :cuenta_id, :presence => {:message => "Seleccione una cuenta"}
end
