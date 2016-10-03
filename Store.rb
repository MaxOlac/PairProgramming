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
      aux_register
    else 
      start 
    end
  end

  def aux_register
    @selected_option = gets.chomp
    if @selected_option == "back" 
        start
      elsif @selected_option == "1"
        register  
      else
        vista_selected_option_error
        aux_register
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
      login_error
    else 
      Cliente.new(name).start 
    end
  end

  def login_error
      @selected_option = gets.chomp
      if @selected_option == "back" 
        start 
      elsif @selected_option == "1" 
        login 
      else 
        vista_selected_option_error 
        login_error
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
    @products=modelo_productos_cliente
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
      when 3
        shopping_Cart
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
    vista_productos_cliente(@products)
    if @products.size == 0 
      start 
    else
      products_aux(@products)
    end
  end

  def products_aux(productos_array)
    @selected_option = gets.chomp
    if @selected_option.to_i.between?(1,productos_array.size)|| @selected_option == 'back'
      if @selected_option == "back" 
        start 
      elsif productos_array[@selected_option.to_i-1][2].to_i == 0
        vista_soldout
        products_aux(productos_array)
      else
        vista_selected_product(productos_array[@selected_option.to_i-1][0])
        products_aux2(productos_array,@selected_option)
      end
    else
      vista_selected_option_error
      products_aux(productos_array)
    end
  end

  def products_aux2(array,answer)
    @selected_option = gets.chomp
    if @selected_option == "back"
      start 
    elsif @selected_option.to_i.between?(1,array[answer.to_i-1][2].to_i)
      vista_add_product_client(@selected_option,array[answer.to_i-1][0])
      @shopping_cart << [array[answer.to_i-1][0],@selected_option,@selected_option.to_i*array[answer.to_i-1][1].to_i]
      sale(answer.to_i-1,@selected_option)
      start
    else
      vista_selected_option_error
      products_aux2(array,answer)
    end
  end

  def sale(index,quantity)
    @products[index][2] = (@products[index][2].to_i - quantity.to_i).to_s
  end

  def shopping_Cart
    vista_shopping_Cart(@name,@shopping_cart)
    if @shopping_cart.size == 0
      start
    else
      @selected_option = gets.chomp
      if @selected_option == "1" 
        start 
      elsif @selected_option == "2" 
        vista_delete_pruduct2(delete_product)
        shopping_Cart
      else 
        vista_error 
      end
    end
  end

  def delete_product
    vista_delete_pruduct1
    @selected_option = gets.chomp
    if @selected_option.to_i.between?(1,@shopping_cart.size)|| @selected_option == 'back'
      if @selected_option == 'back'
        shopping_Cart
      else
        aux =  @shopping_cart[@selected_option.to_i-1]
        @shopping_cart.delete_at(@selected_option.to_i-1)
        return aux
      end
    else
      vista_selected_option_error
      delete_product
    end
  end




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


