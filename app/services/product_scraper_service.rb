require 'nokogiri'
require 'open-uri'

class ProductScraper
  def initialize(url)
    @url = url
  end

  def scrape_price
    # Baixa o HTML da página
    html = URI.open(@url)
    doc = Nokogiri::HTML(html)

    # Ajuste o seletor CSS para a página que você está scraping
    price_element = doc.css('.price') # Substitua '.price' pelo seletor correto
    price = price_element.text.strip

    # Converte o preço para um formato numérico (se necessário)
    format_price(price)
  end

  private

  def format_price(price_string)
    price_string.gsub(/[^\d,.]/, '').tr(',', '.').to_f
  end
end
