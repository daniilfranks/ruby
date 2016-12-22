class APIClient
  attr_reader :shop_id

  SECRET_API_KEY = 'dsfh34h8f7hqh8h78H87HF78Hhfhudfsh78743'
  TARGET_HOST    = 'example.com'

  def set_shop_id(shop_id)
    @shop_id = shop_id
  end

  def order
    api_get("http://#{TARGET_HOST}/#{shop_id}/orders")
  end

  def product
    api_get("http://#{TARGET_HOST}/#{shop_id}/products")
  end

  def product(id)
    api_get("http://#{TARGET_HOST}/#{shop_id}/products/#{id}")
  end

  private

  def api_get(path = '')
    product_json = some_http_library.get(path, {basic_auth: {username: SECRET_API_KEY, pasword: ''}})
    JSON.parse(product_json)
  end
end
