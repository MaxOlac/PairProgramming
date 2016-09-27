class Tortas
  attr_accessor :tipo, :estado
  def initialize(tipo)
    @tipo=tipo
    @estado="crudo"
    p "Torta de #{@tipo}"
  end
  def next_state(estados)
    index = estados.index(@estado)  
    if @estado != "quemado"
      @estado = estados[index+1]
    end
  end
  def to_s
    "Torta de #{@tipo} estado #{@estado}"
  end

end

class Horno
attr_accessor  :tortas
  def initialize
    @tortas=[]
    @estados=["crudo","casi listo","listo","quemado"]
  end
  def add_torta(torta)
    @tortas<<torta
  end
  def start_oven
    @tortas.each{|torta| torta.next_state(@estados)}
  end
  def tortas_listas?
    num=0
    @tortas.each{|torta| num+=1 if torta.estado == "listo"}
    num
  end
  def get_torta
    arre = []
    @tortas.each{|torta| arre << torta if torta.estado == "listo"}
    @tortas.delete_if{|torta| torta.estado == "listo"}
    arre
  end
end
tortas=["Jamon", "Chorizo","Pierna","Milanesa","Pollo"]
horno_1=Horno.new
p "Horno creado"
p "Se preparan 3 tortas y se inicia el horno:"
for i in 0..2
horno_1.add_torta(Tortas.new(tortas[rand(4)]))
horno_1.start_oven
end
p "Se preparan 3 tortas y se inicia el horno:"
for i in 0..2
horno_1.add_torta(Tortas.new(tortas[rand(4)]))
horno_1.start_oven
end
p "Se preparan 3 tortas y se inicia el horno:"
for i in 0..2
horno_1.add_torta(Tortas.new(tortas[rand(4)]))
horno_1.start_oven
end
p "Fin del ciclo"
p "Get torta"
p horno_1.get_torta
p "Tortas"
p horno_1.tortas



