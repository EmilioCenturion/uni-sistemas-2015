class Cliente < ActiveRecord::Base
  audited
  belongs_to :pai
  belongs_to :ciudad

  	def name_cliente
		"#{nombre} - #{ruc}"
	end
end
