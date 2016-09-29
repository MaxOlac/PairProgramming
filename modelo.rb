require 'csv'
$file='tareas.csv'

def modelo_index
  CSV.read($file)
end
# CSV.foreach('tareas.csv') do |row| 
#         print "#{count+=1}. #{row[0]}\n"
# end
def modelo_add(string)
  string = "[ ] "+string 
  CSV.open($file, "a+") do |csv|
        csv.puts([string])
  end
end
def modelo_index_error(index)
  tareas = CSV.read($file)
  tareas.size > index
end

def modelo_delete(index)
  tareas = CSV.read($file)
  tarea =tareas[index][0].sub(/\[\]/,"")
  tareas.delete_at(index)
  for  i in 0..tareas.size-1
    if i == 0  
      CSV.open($file, "wb") do |csv|
      csv << tareas[i]
      end
    else
      CSV.open($file, "a+") do |csv|
        csv.puts(tareas[i])
      end
    end
  end
  return tarea
end   

def modelo_complete(index)
  tareas = CSV.read($file)
  tarea = tareas[index][0]
  tarea.sub!(/\[.\]/,"[x]")
  tareas[index][0]=tarea
  for  i in 0..tareas.size-1
    if i == 0  
      CSV.open($file, "wb") do |csv|
      csv << tareas[i]
      end
    else
      CSV.open($file, "a+") do |csv|
        csv.puts(tareas[i])
      end
    end
  end
  return tarea.sub!(/\[.\]/,"")
end    
