require 'csv'
#Carga los csv's a las variables globales
def modelo_start
  $productos = 'Productos.csv'
  $clientes = 'Usuarios.csv'
  $vendedores = 'Vendedores.csv'
end
#Verifica que el user name no este en la Base de Datos (BD)
#Si lo encuetra regresa 'false'; si no, lo agrega a la BD y regresa 'true'
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
  count == 0
end
#Verifica que el user name y el password esten en la BD y coincidan
#Si coinciden, regresa 'true'; de lo contrario, regresa 'false'
def modelo_login_cliente(name,password)
  CSV.foreach($clientes,headers:true) do |row|
    if row['name'] == name && row['pass'] == password then return true end
  end
  false
end
#Regresa un arreglo con los productos
def modelo_productos_cliente
  array_products=[]
  CSV.foreach($productos,headers:true) do |row|
    array_products << [row['producto'],row['precio'],row['num_existencia']]
  end
  array_products
end
#Verifica que el user name y el password esten en la BD y coincidan
#Si coinciden, regresa 'true'; de lo contrario, regresa 'false'
def modelo_login_vendedor(name,password)
  CSV.foreach($vendedores,headers:true) do |row|
    if row['name'] == name && row['pass'] == password then return true end
  end
  false
end
def modelo_add_product(name,price,quantity)
    CSV.open($productos, "a+") do |csv|
      csv << [name,price,quantity]
    end 
end
def modelo_delete_product(index)
  aux = CSV.read($productos,headers:true)
  aux = aux.to_a
  aux.delete_at(index)
  aux.delete_at(0)
  CSV.open($productos, "w") do |csv|
     csv << ["producto","precio","num_existencia"]
  end 
  aux.each do |row|
    CSV.open($productos, "a+") do |csv|
       csv << row
    end
  end 
end