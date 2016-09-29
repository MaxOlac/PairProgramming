require 'io/console'
require_relative 'StoreM.rb'
require_relative 'StoreV.rb'


class Store

  def initialize
    start
    @selected_option
  end

  private

  def start
    vista_welcome
    modelo_start
    @selected_option = gets.chomp.to_i
    vista_selected_option(@selected_option)
    option(@selected_option)
  end

  def option(index)
    case index
      when 1
        login
      when 2
        register
      else
        print "\nPerdone las molestias seguimos desarrollando\n"
    end
  end
  def register
    vista_user_name
    name = gets.chomp
    vista_user_pass
    pass = STDIN.noecho(&:gets).chomp
    resp = modelo_register(name,pass)
    vista_register(resp)
    if !resp then register else start end
  end
  def login
    vista_user_name
    name = gets.chomp
    vista_user_pass
    pass = STDIN.noecho(&:gets).chomp
    p resp = modelo_login_cliente(name,pass)
    vista_login_cliente(name,resp)
    if !resp 
      login 
    else 
      Cliente.new(name).start
     end
  end

end

class Vendedor
#logout
#agregar productos
#eliminar producto
#productos en existencia
#ventas
end

class Clientes
  def initialize(name)
    @name = name
  end
  def start
  end
#logout
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

Store.new


