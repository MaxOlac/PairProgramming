require_relative 'MaratonV.rb'
require_relative 'MaratonM.rb'

class Maraton 
  def initialize
    @index_pregunta = 0
    @ciclo_tam = 0
  end
  def start
    vista_start
    @ciclo_tam = modelo_start
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
    @index_pregunta += 1
    if @index_pregunta < @ciclo_tam
      preguntas(@index_pregunta)
    else
      respuestas = modulo_despido
      vista_despido(respuestas[0],respuestas[1])
      break
    end
  end
  def evaluacion(string1,string2)
    if string1 == string2 
      modelo_contador(1)
      "Correcto!" 
    else
      p string2
      modelo_contador(0)
      "Incorrecto!"
    end
  end
end

maraton=Maraton.new
maraton.start