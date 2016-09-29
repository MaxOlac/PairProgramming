require 'csv'
$file='Preguntas.csv'
$arre_preguntas = []
$arre_respuestas = []
$correctas = 0
$incorrectas = 0 
def modelo_start
  arrefile=[]
  CSV.foreach($file) do |row|
    arrefile << row[0]
  end
  arrefile.compact!
  $arre_preguntas = arrefile.values_at(* arrefile.each_index.select {|i|i.even?})
  $arre_respuestas = arrefile.values_at(* arrefile.each_index.select {|i|i.odd?})
  $arre_preguntas.size  
end

def modelo_preguntas(index)
  $arre_preguntas[index]
end

def modelo_respuestas(index)
  $arre_respuestas[index]
end

def modelo_contador(int)
  int == 0 ? $incorrectas += 1 : $correctas += 1
end 

def modelo_despido
  return $correctas , $incorrectas
end