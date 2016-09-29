def vista_welcome
  print "\nWelcome to the online store:\n
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
print int == 0 ? "\nInvalid 'User name' or 'Password' \n" : "\nCongratulations!! Successful Registration\n"
end