class MerchantService 

  def self.get_url(url, param = nil)
    conn = Faraday.new(url: "http://localhost:3000/") do |faraday|
      faraday.params[:name] = param unless param == nil
    end 

  response = conn.get(url)
  JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_merchants
    get_url("api/v1/merchants")[:data]
  end 

  def self.get_merchant(id)
    get_url("api/v1/merchants/#{id}")[:data]
  end 

  def self.get_merchant_items(id)
    get_url("api/v1/merchants/#{id}/items")[:data]
  end

  def self.one_merchant_search(name)
    get_url("api/v1/merchants/find", name)[:data]
    # get_url("api/v1/merchants/find?name=#{name}")[:data]
  end 

end