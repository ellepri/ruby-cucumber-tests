# Class to handle response from client
class Response
  attr_reader :code, :request_url, :body, :headers, :data

  def initialize(response)
    @code = response.code
    @body = Hashie::Mash.new(JSON.parse(response.body))
    @request_url = response.request.last_uri.to_s
    @headers = response.headers
    @data = @body.data
  end
end
