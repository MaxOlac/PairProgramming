require 'csv'

def modelo_start
  $productos = 'Productos.csv'
  $clientes = 'Usuarios.csv'
  $vendedores = 'Vendedores.csv'
end

def modelo_register(name,password)
  count=0
  CSV.foreach($clientes,headers:true) do |cliente|
    if row['name']==name then count += 1 
  end
  count
end