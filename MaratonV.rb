def vista_start
  print "Bienvenido a Maratón. Te daremos una pregunta y deberás adivinar la respuesta correcta. Listo?  Arranca el juego!\n\n"
end

def vista_preguntas(string)
  print "Pregunta\n"
  print "#{string}\n"
end

def vista_respuestas(string1,string2)
  print "Intento: #{string1}\n"
  print "#{string2}"
end