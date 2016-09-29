def vista_index(array)
  count=0
  array.each do |element|
    print "#{count+=1}. #{element[0]}\n"
  end
end
def vista_add(string)
   print "Agregaste la tarea: '#{string}' a tu lista.\n"
end
def vista_delete(string)
  print "Eliminaste la tarea: '#{string}' de tu lista.\n"
end