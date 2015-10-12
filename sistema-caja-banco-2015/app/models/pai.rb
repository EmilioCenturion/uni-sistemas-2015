class Pai < ActiveRecord::Base
	has_many :bancos
	def name_pais
		"#{nombre}"
	end
end
