class PriceScraperJob < ApplicationJob
  queue_as :scraping

  def perform(product_id)
    product = Product.find(product_id)
    response = HTTParty.get(product.url)

    # Ajuste a lógica de parsing de acordo com o site
    parsed_price = parse_price(response.body)

    # Atualiza o preço e o timestamp do produto
    product.update(price: parsed_price, last_scraped_at: Time.current)
  end

  private

  def parse_price(html)
    # Exemplo de parsing usando Nokogiri
    doc = Nokogiri::HTML(html)
    price_element = doc.css('seletor_do_preco').text.strip
    price_element.gsub(/[^\d,\.]/, '').to_f
  end
end
