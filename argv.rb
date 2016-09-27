puts "Los argumentos recibidos son:"
puts ARGV.inspect

def convertidor(palabra)
  if palabra.chars[0].count("aeiou") == 1
     aux=palabra+"way"
  else
    num = palabra.chars.index{|x| x.count("aeiou") == 1}
    aux = palabra[num..palabra.size]+palabra[0..num-1]+"ay"
  end
  aux
end
arre=[]
ARGV.each{|x|arre<<convertidor(x)}
puts "Después de Ping Latin "
p arre