class Pai < ActiveRecord::Base
	belongs_to :Banco
	def name_pais
		"#{nombre}"
	end
end
