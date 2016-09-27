class Tortas
  attr_accessor :tipo, :estado
  def initialize(tipo)
    @tipo=tipo
    @estado="crudo"
  end
  def next_state(estados)
    index = estados.index(@estado)  
    if @estado != "quemado"
      @estado = estados[index+1]
    end
  end

end

class Horno
attr_accessor  :tortas
  def initialize
    @tortas=[]
    @estados=["crudo","casi listo","listo","quemado"]
  end
  def add_torta=(torta)
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
    @tortas.drop_while{|torta| torta.estado == "listo"}
  end
end

horno_1=Horno.new
torta_jamon=Torta.new("Jamon")
horno_1.add_torta(torta_jamon)



