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
    respuestas(index)
  end 
  def respuestas(index)
    intento = gets.chomp 
    respuesta = modelo_respuestas(index)
    vista_respuestas(intento, evaluacion(intento,respuesta))
  end
  def evaluacion(string1,string2)
    if string1 == string2 
      modelo_contador(1)
      "Correcto!" 
    else
      modelo_contador(0)
      "Incorrecto!"
    end
  end
end

maraton=Maraton.new
maraton.start