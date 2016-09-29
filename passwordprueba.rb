# require 'io/console'
# print "Password: "
# password = STDIN.noecho(&:gets).chomp
# p password
require 'csv'
productos = 'Productos.csv'
pro=CSV.read('Productos.csv', headers:true).to_a
p pro
CSV.foreach(productos, headers:true) do |row|
  puts row['producto']
end