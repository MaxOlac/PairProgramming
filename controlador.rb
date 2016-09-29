require_relative 'modelo.rb'
require_relative 'vista.rb'

instruccion=[]

ARGV.each do |x|
  instruccion << x
end

def make_s(arre)
  string=""
  arre.each{|x| string<<"#{x} "}
  string
end

if !instruccion.empty?
  case instruccion[0] 
  when "index"
      index = 
      count=0
      CSV.foreach('tareas.csv') do |row| 
        print "#{count+=1}. #{row[0]}\n"
      end
      prueba
  when "add"
      aux=make_s(instruccion[1..instruccion.size-1])
      CSV.open(file, "a+") do |csv|
        csv.puts([aux])
      end
      print "Agregaste la tarea: '#{aux}' a tu lista.\n"
  # when "delete"
  #     tareas= CSV.read(file)
  #     p tareas[instruccion[1].to_i-1][0]
  #     print "Eliminaste la tarea: #{tareas[instruccion[1].to_i-1][0]} de tu lista.\n"
  #     tareas.delete_at(instruccion[1].to_i-1)
  #     p tareas
  #     count=0
  #     CSV.foreach('tareas.csv') do |row| 
  #       print "#{count+=1}. #{row[0]}\n"
  #     end
  end
end