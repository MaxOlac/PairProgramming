require 'csv'

def modelo_start
  $productos = CCV.read('Productos.csv', headers:true)
  $clientes = CCV.read('Usuarios.csv', headers:true)
  $vendedores = CCV.read('Vendedores.csv', headers:true)
end

def modelo_register(name,password)
  arrefile=[]
  CSV.foreach($clientes) do |row|
    arrefile << row[0]
  end
  p arrefile
  1
end