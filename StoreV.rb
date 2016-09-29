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

def vista_register(int)
print int != 0 ? "\nInvalid 'User name' or 'Password' \n" : "\nCongratulations!! Successful Registration\n"
end
def vista_login_cliente(name,bo)
  if bo
  print "\n\n#{name.capitalize}, welcome to the online store: Your type is Client.\n-------------------------------------------------------------------\n
  Select option number:\n
  1. Logout
  2. Products
  3. Shopping Cart\n\n"
  else
    "\n\nInvalid 'User name' or 'Password' please try again\n"
  end
end