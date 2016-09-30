require 'io/console'
require_relative 'StoreM.rb'
require_relative 'StoreV.rb'


class Store

  def initialize
    @selected_option
  end

 

  def start
    vista_welcome
    modelo_start
    @selected_option = gets.chomp.to_i
    vista_selected_option(@selected_option)
    option(@selected_option)
  end
  private
  def option(index)
    case index
      when 1
        login
      when 2
        register
      when 4
        exit_store
      else
        vista_error
        start
     end
  end
  def register
    vista_user_name
    name = gets.chomp
    vista_user_pass
    pass = STDIN.noecho(&:gets).chomp
    resp = modelo_register(name,pass)
    vista_register(resp)
    if !resp
      @selected_option = gets.chomp
      if @selected_option == "exit" then start else register end
    else 
      start 
    end
  end
  def login
    vista_user_name
    name = gets.chomp
    vista_user_pass
    pass = STDIN.noecho(&:gets).chomp
    resp = modelo_login_cliente(name,pass)
    if !resp  
      vista_login_cliente_error
      @selected_option = gets.chomp
      if @selected_option == "exit" then start else login end 
    else 
      Cliente.new(name).start 
    end
  end
  def exit_store
    vista_exit_store
    exit
  end

end

class Vendedor
#logout
#agregar productos
#eliminar producto
#productos en existencia
#ventas
end

class Cliente
  def initialize(name)
    @name = name
    @shopping_cart=[]
    @selected_option
  end
  def start 
    vista_login_cliente(@name)
    @selected_option = gets.chomp.to_i
    vista_selected_option(@selected_option)
    option(@selected_option)
  end
  def option(index)
    case index
      when 1
        logout
      when 2
      products
      # when 3
      #   shopping_Cart
      else
        vista_error
        start
     end
  end
  def logout
    vista_logout(@name)
    $mystore.start
  end
  def products
    productos_array = modelo_productos_cliente
    vista_productos_cliente(productos_array)
    if productos_array.size == 0 then start end
    products_aux(productos_array)
  end
  def products_aux(productos_array)
    @selected_option = gets.chomp
    if @selected_option.to_i.between?(1,productos_array.size)|| @selected_option == 'back'
       products_aux2(@selected_option,productos_array)
        #verificar cantidad
        #agregar el producto al carrito
        #imprimir mensaje de agregado 
    else
        vista_selected_option_error
        @selected_option = gets.chomp
        products_aux(productos_array0,)
    end
  end
  def products_aux2(answer,array)
    if answer == "back" then start end
    vista_selected_product(array[answer.to_i-1][0])
    @selected_option = gets.chomp
    if @selected_option.to_i.between(1..array[answer.to_i-1][1].to_i)
      p "Todo bien"
    else
      vista_selected_option_error
      products_aux2(answer,array)
    end
  end

#ver productos
#comprar productos
#productos en carrito 
#eliminar producto en carrito
end

class Administrador
#logout
#agregar productos
#eliminar producto
#agregar clientes
#eliminar cliente
#agregar vendedores
#eliminar vendedores
#productos en existencia
#vendedores
#clientes
end

$mystore = Store.new
$mystore.start


