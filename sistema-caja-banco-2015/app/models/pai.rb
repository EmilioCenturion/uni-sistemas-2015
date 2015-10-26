class Pai < ActiveRecord::Base
	has_many :bancos
	def name_pais
		"#{nombre}"
	end

	validates :nombre, :uniqueness => {:message => "Ya existe este Pais"}
	
end
