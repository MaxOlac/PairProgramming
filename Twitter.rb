require 'Nokogiri'
require 'open-uri'

link=ARGV.inspect.gsub(/\[\"/,"").chop.chop
html_file = open(link)

class TwitterScrapper
  def initialize(url)
    @doc = Nokogiri::HTML(File.open(url))
    @stats = []
    @name = ""
    @tweets = []
    @fechas = []
    @rtwfav = []
  end

  def extract_username
   @name=@doc.search(".ProfileHeaderCard-name > a").first.inner_text
  end

  def extract_tweets
    @doc.xpath('//div[@class="js-tweet-text-container"]').each do |x|
      @tweets << x.text.gsub(/\n/,"").lstrip 
    end
    @doc.xpath('//small[@class="time"]').each do |x|
      @fechas << x.inner_text.gsub(/\n/,"").lstrip 
    end
    @doc.xpath('//span[@class="ProfileTweet-actionCountForPresentation"]').each do |x|
      @rtwfav << x.text
    end
    @rtwfav=@rtwfav.values_at(* @rtwfav.each_index.select {|i|i.even?})
  end

  def extract_stats
    @doc.xpath('//span[@class="ProfileNav-value"]').each do |x|
      @stats << x.text
    end
  end
  def to_s
    print "\n\n"
    print "Username: #{@name}\n"
    print "--------------------------------------------------------------------------------------------------------\n"
    print "Stats: Tweets: #{@stats[0]} Siguiendo: #{@stats[1]} Seguidores: #{@stats[2]} Favoritos: #{@stats[3]}\n"
    print "--------------------------------------------------------------------------------------------------------\n"
    print "Tweets:\n"
    for i in 0..@fechas.size-1
    print "#{@fechas[i]}: #{@tweets[i]} \nRetweets: #{@rtwfav[2*i]}, Favorites: #{@rtwfav[2*i+1]}\n\n"
    end
  end

end

twitter=TwitterScrapper.new(html_file)
twitter.extract_username
twitter.extract_stats
twitter.extract_tweets
twitter.to_s