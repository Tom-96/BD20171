class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tropas_por_usuarios
  has_many :tropas, :through => :tropas_por_usuarios

  has_many :recursos_por_usuarios
  has_many :recursos, :through => :recursos_por_usuarios

end
