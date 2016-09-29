require_relative 'MaratonV.rb'
require_relative 'MaratonM.rb'

class Maraton 
  def initialize
    @index_pregunta = 0
  end
  def start
    vista_start
    modelo_start
    preguntas(@index_pregunta)
  end 
  private
  def preguntas(index)
    pregunta = modelo_preguntas(index)
    vista_preguntas(pregunta)
  end 
end

maraton=Maraton.new
maraton.start