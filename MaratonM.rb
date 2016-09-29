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
end

def modelo_preguntas(index)
  $arre_respuestas[index]
end