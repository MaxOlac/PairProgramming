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
    @selected_option=gets.chomp.to_i
    vista_selected_option(@selected_option)
    option(@selected_option)
  end

  def option(index)
    case index
      when 1
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
    vista_register(modelo_register(name,pass))
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


