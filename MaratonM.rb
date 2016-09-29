require 'csv'
$file1 = 'Deck1.csv'
$file2 = 'Deck2.csv'
$arre_preguntas = []
$arre_respuestas = []
$arre_opciones = []
$correctas = 0
$incorrectas = 0 
def modelo_start(int)
  int == 1 ? deck = $file1 : deck = $file2
  arrefile=[]
  CSV.foreach(deck) do |row|
    arrefile << row[0]
  end
  arrefile.compact!
  for i in 0..9
    $arre_preguntas << arrefile[i*5]
    $arre_respuestas << arrefile[i*5+1]
    $arre_opciones << arrefile[i*5+2..i*5+4]
  end
  $arre_preguntas.size 
end

def modelo_preguntas(index)
  arre_aux=[]
  arre_aux << $arre_preguntas[index]
  arre_aux << $arre_opciones[index]
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