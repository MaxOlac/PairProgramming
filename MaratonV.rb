def vista_start
  print "\n\n"
  print "Bienvenido a Maratón. Te daremos una pregunta y deberás adivinar la respuesta correcta. Listo?  Escoge tu deck (1) o (2)\n"
end

def vista_preguntas(string1,string2,string3,string4)
  print "Pregunta\n"
  print "#{string1}\n"
  sleep(1)
  print "#{string2}\n"
  print "#{string3}\n"
  print "#{string4}\n"
end

def vista_respuestas(string1,string2)
  print "Intento: #{string1}\n"
  sleep(1)
  print "#{string2}\n\n"
end

def vista_despido(int1,int2)
  print "Acabaste:\n"
  sleep(1)
  print "Tuviste #{int1} Correctas y #{int2} Incorrectas\n\n"
end