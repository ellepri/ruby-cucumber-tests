# Class to create a client request
class HTTPClient
  include HTTParty

  base_uri 'https://example.com'

  def get_request(url, options = {})
    self.class.get url, options
  end

  def post_request(url, options = {})
    self.class.post url, options
  end

  # def cert
  #   File.read(ENV['CERT']) if assignable?(ENV['CERT'])
  # end
end
