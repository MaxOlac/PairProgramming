require 'net/http'
require 'Nokogiri' 
$linkss
class Page
  def initialize(url)
    @url = url
    @doc =fetch!
    @links=[]
    @title=""
  end

  def fetch!
    res = Net::HTTP.get_response(URI(@url))
    Nokogiri::HTML(res.body)
  end

  def links
    @links=@doc.css("a")
    $linkss=@links
   end

  def title
   @title = @doc.css('title').text
  end
  def to_s
    links
    title
    print "\n\n"
    print "url> #{@url}\nFetching"
    sleep(1)
    print "."
    sleep(1)
    print "."
    sleep(1)
    print ".\n"
    print "Titulo: #{@title} \nLinks:\n"
    sleep(1)
    for i in 0..10#@links.length-1
      print  "#{@links[i].text}: #{@links[i]["href"]}\n"
      sleep(1)
    end 
    print "url>\n\n"
  end
end

class Browser
  def run!
    url2=""
    print "Dame un URL: \n"
    @url1=gets.chomp
    while @url1 != "salir"
      url2=@url1
      pagina=Page.new(@url1)
      pagina.to_s
      print "Dame un URL o escribe 'salir' para salir: \n"
      @url1=gets.chomp
      for i in 0..10  
        if @url1 == $linkss[i].text
          @url1=url2+$linkss[i]["href"]
        end 
      end  
    end
  end
end

Browser.new.run!
