def vista_start
  print "\n\n"
  print "Bienvenido a Maratón. Te daremos una pregunta y deberás adivinar la respuesta correcta. Listo?  Arranca el juego!\n\n"
    #leep(1)
end

def vista_preguntas(string)
  print "Pregunta\n"
  #sleep(1)
  print "#{string}\n"
end

def vista_respuestas(string1,string2)
  print "Intento: #{string1}\n"
  #sleep(1)
  print "#{string2}\n\n"
end

def vista_despido(int1,int2)
  print "Acabaste:\n"
  #sleep(1)
  print "Tuviste #{int1} Correctas y #{int2} Incorrectas\n\n"
end