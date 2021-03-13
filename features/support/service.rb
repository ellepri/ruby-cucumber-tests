# Collection of methods to return client request with response
# methods used in step definitions
module Service
  def request(url, method)
    @options = {} if @options.nil?
    case method
    when 'GET'
      request = http_client.get_request(url, @options)
    when 'POST'
      request = http_client.post_request(url, @options)
    else
      raise "Wrong method: #{method}"
    end

    @response = Response.new(request)
  end

  def request_options(hash)
    @options = {} if @options.nil?
    @options.merge!(hash)
  end

  def last_response
    raise 'No response yet, send a request first.' unless @response

    @response
  end
end
