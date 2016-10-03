# Imprime la pantalla de "Bienvenida"
def vista_welcome
  print "\nWelcome to the online store:\n-------------------------------------------------------------------\n
  Select option number:\n
  1. Login
  2. Register
  3. Vendedor
  4. Exit \n\n"
end
# Imprime la opcion seleccionada
def vista_selected_option(index)
  print "\nYou have selected option '#{index}'\n"
end
# Imprime para que el usuario ponga su "User Name"
def vista_user_name
print "\nUser name: "
end
# Imprime para que el usuario ponga su "Password"
def vista_user_pass
print "\nPassword: "
end
# Imprime si el registro fue valido o mensage de error en caso de error
def vista_register(bo)
print !bo ? "\nInvalid 'User name' or 'Password'. Type '1' to try again or 'back' to select an other option. \n" : "\nCongratulations!! Successful Registration\n"
end
# Imprime 'Frontpage' para el Cliente
def vista_login_cliente(name)
    print "\n\n#{name.capitalize}, welcome to the online store: Your type is Client.\n-------------------------------------------------------------------\n
    Select option number:\n
    1. Logout
    2. Products
    3. Shopping Cart\n\n"
end
# Mesaje de error en caso de login fallido 
def vista_login_cliente_error
  print "\n\nInvalid 'User name' or 'Password'.
  Type '1' to try again or 'back' to select an other option.\n"
end
# Mensaje de despedida
def vista_exit_store
    print "\n\nYou have exited the store, goodbye!\n\n"
end
# Mensaje de error en caso de opcion no valida
def vista_error
  print "\nSorry about the inconvenience, site still under development.\n"
  for i in 1..3
    sleep(1)
    print "."
  end
end
# Mensge para el logout
def vista_logout(name)
  print "\n\n #{name.capitalize}, you have successfully logged out, goodbye!\n"
  for i in 1..3
    sleep(0.5)
    print ".\n"
  end
end
# Imprime los productos con formato
def vista_productos_cliente(array_products)
  if array_products.size > 0
    print "\nProducts:\n-------------------------------------------------------------------\n"
    print "== 'Product' == 'Available Quantity' == 'Price per unit' \n\n"
    for i in 0..array_products.count-1
      print "#{i+1}.  #{(array_products[i][0]).ljust(7)} ==          #{(array_products[i][2]).ljust(15)} ==      $ #{array_products[i][1].ljust(10)}\n"
    end
    print "\nPut the number of the item you wish to add to your shopping cart.
     Or type 'back' to go back to the main menu. \n\n"  
   else
    print "\nSorry! No products available at this time, come back later!\n"
   end
end

def vista_selected_option_error
  print "\nInvalid option, please try again.
    Or type 'back' to go back to the main menu. \n\n"
end

def vista_selected_product(name)
    print "\nProduct: '#{name}'\n
    Quantity?\n"
end

def vista_add_product_client(num,name)
  for i in 1..3
    sleep(1)
    print "."
  end
  print "\nSuccessful added #{num} of product: '#{name}'\n"
  sleep(1)
end

def vista_shopping_Cart(name,array_products)
  if array_products.size > 0
    for i in 1..3
      sleep(1)
      print "."
    end
    print "\nProducts:\n-------------------------------------------------------------------\n"
    print "== 'Product' == 'Quantity' == 'Total price' \n\n"
    for i in 0..array_products.count-1
      print "#{i+1}.  #{(array_products[i][0]).ljust(8)} ==       #{(array_products[i][1]).ljust(5)} ==      $ #{array_products[i][2].to_s.ljust(5)}\n"
    end
    print "\n\n#{name.capitalize}:\n-------------------------------------------------------------------\n
    Please select option number:\n
    1. Back
    2. Delete Product\n\n" 
   else
    print "\nSorry! No products available in your cart at this time, add some products!\n"
    for i in 1..3
      sleep(1)
      print "."
    end
   end
end

def vista_soldout
  print "\nSorry, there are no more products available.
  Please select another product or type 'back' to go to the 'Main Menu'\n"
end

def vista_delete_pruduct1
print "\n Choose the number of the item you wish to delete or type 'back' to go BACK\n"
end

def vista_delete_pruduct2(delete_product)
print "\n You have deleted #{delete_product[1]} #{delete_product[0]}\n"
end

