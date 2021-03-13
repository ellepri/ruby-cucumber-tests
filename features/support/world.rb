# Easy page object access
module TestWorld
  def http_client
    @http_client ||= HTTPClient.new
  end
end
