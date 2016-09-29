require_relative 'modelo.rb'
require_relative 'vista.rb'

instruccion = []

ARGV.each do |x|
  instruccion << x
end

def make_s(arre)
  string = ""
  arre.each{|x| string << "#{x} "}
  string
end

if !instruccion.empty?
  case instruccion[0] 
  when "index"
        index = modelo_index
        vista_index(index)
  when "add"
        aux = make_s(instruccion[1..instruccion.size-1])
        modelo_add(aux)
        vista_add(aux)
  when "delete"
        bo = modelo_index_error(instruccion[1].to_i-1)
        raise "Error en el index" unless bo 
        tarea = modelo_delete(instruccion[1].to_i-1)
        vista_delete(tarea)
        index = modelo_index
        vista_index(index)
  when "complete"
        bo = modelo_index_error(instruccion[1].to_i-1)
        raise "Error en el index" unless bo 
        tarea =  modelo_complete(instruccion[1].to_i-1)
        vista_complete(tarea)
        index = modelo_index
        vista_index(index)
  end
end