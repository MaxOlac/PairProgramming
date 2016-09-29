require 'csv'

def modelo_start
  $productos = 'Productos.csv'
  $clientes = 'Usuarios.csv'
  $vendedores = 'Vendedores.csv'
end

def modelo_register(name,password)
  count=0
  CSV.foreach($clientes,headers:true) do |row|
    if row['name']==name then count += 1 end
  end
  if count == 0
    CSV.open($clientes, "a+") do |csv|
      csv << [name,password,0]
    end 
  end
  count
end