class Banco < ActiveRecord::Base
	belongs_to :pai
	belongs_to :ciudad
	def name_banco
		"#{nombre}"
	end
end
