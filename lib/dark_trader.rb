require 'rubygems'
  require 'nokogiri'
    require 'open-uri'
        

def scrapping
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all"))

  crypto_name_symbol = page.xpath('//td[contains(@class,"symbol")]')

  crypto_value = page.xpath('//td[contains(@class,"price")]')

  crypto_name_symbol_array = crypto_name_symbol.collect(&:text)

  crypto_value_array = crypto_value.collect(&:text)

  data = Hash[crypto_name_symbol_array.zip crypto_value_array]
  
  final_data = data.map {|key, value| puts "#{key} => #{value.delete("$,").to_f}"}
    return final_data
end 

def perform 
  scrapping
end

perform 
