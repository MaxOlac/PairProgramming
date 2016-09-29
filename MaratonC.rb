require_relative 'MaratonV.rb'
require_relative 'MaratonM.rb'

class Maraton 
  def initialize
    @index_pregunta = 0
    @ciclo_tam = 0
  end
  def start
    vista_start
    int = gets.chomp.to_i
    raise "Error en la selección del Deck" unless (int == 2 || int == 1)
    @ciclo_tam = modelo_start(int)
    preguntas(@index_pregunta)
  end 
  private
  def preguntas(index)
    pregunta = modelo_preguntas(index)
    vista_preguntas(pregunta[0],pregunta[1][0],pregunta[1][1],pregunta[1][2])
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
      respuestas = modelo_despido
      vista_despido(respuestas[0],respuestas[1])
     end
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