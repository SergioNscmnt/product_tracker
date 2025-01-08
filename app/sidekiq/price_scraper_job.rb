class PriceScraperJob < ApplicationJob
  queue_as :default

  def perform(product_id)
    product = Product.find(product_id)

    # Chama o serviço de scraping
    scraper = ProductScraper.new(product.url)
    new_price = scraper.scrape_price

    # Atualiza o preço e a data de scraping no produto
    product.update(price: new_price, last_scraped_at: Time.current)
  end
end
