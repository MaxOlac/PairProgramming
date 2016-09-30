def vista_welcome
  print "\nWelcome to the online store:\n-------------------------------------------------------------------\n
  Select option number:\n
  1. Login
  2. Register
  3. Vendedor
  4. Exit \n\n"
end
def vista_selected_option(index)
  print "\nYou have selected option '#{index}'\n"
end

def vista_user_name
print "\nUser name: "
end

def vista_user_pass
print "\nPassword: "
end

def vista_register(bo)
print !bo ? "\nInvalid 'User name' or 'Password'. Type '1' to try again or 'exit' to select an other option. \n" : "\nCongratulations!! Successful Registration\n"
end

def vista_login_cliente(name)
    print "\n\n#{name.capitalize}, welcome to the online store: Your type is Client.\n-------------------------------------------------------------------\n
    Select option number:\n
    1. Logout
    2. Products
    3. Shopping Cart\n\n"
end

def vista_login_cliente_error
  print "\n\nInvalid 'User name' or 'Password'.
  Type '1' to try again or 'exit' to select an other option.\n"
end

def vista_exit_store
    print "\n\nYou have exited the store, goodbye!\n\n"
end

def vista_error
  print "\nPerdone las molestias seguimos desarrollando\n"
  for i in 1..3
    sleep(1)
    print "."
  end
end

def vista_logout(name)
  print "\n\n #{name.capitalize}, you have successfully logged out, goodbye!\n"
  for i in 1..3
    sleep(0.5)
    print ".\n"
  end
end
def vista_productos_cliente(array_products)
  p array_products
end









