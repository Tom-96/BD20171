class Tropa < ApplicationRecord
	belongs_to :tipo_tropa
	belongs_to :recurso

	has_many :tropas_por_usuarios
	has_many :users, :through => :tropas_por_usuarios

end
