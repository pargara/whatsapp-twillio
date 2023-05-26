module Dog
  extend ActiveSupport::Concern

  def fact
    response = HTTP.get("https://dog-api.kinduff.com/api/facts")
    JSON.parse(response.to_s)["facts"].first
  end

  def picture
    response = HTTP.get("https://dog.ceo/api/breeds/image/random")
    JSON.parse(response.to_s)["message"]
  end
end
