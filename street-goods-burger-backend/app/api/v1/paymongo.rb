require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'dotenv'

Dotenv.load
class Paymongo
  def initialize(url)
    @url = URI(url)
    @http = Net::HTTP.new(@url.host, @url.port)
    @http.use_ssl = true
    @request = Net::HTTP::Post.new(@url)
  end

  def gcash_auth(params:)
    request_body = details(attributes: params[:attributes])
    @request['Accept'] = ENV['ACCEPT']
    @request['Content-Type'] = ENV['CONTENT_TYPE']
    @request['Authorization'] = ENV['AUTHORIZATION']
    @request.body = request_body.to_json

    response = @http.request(@request)

    JSON.parse(response.read_body)
  end

  private

  def details(attributes:)
    {
      data: {
        attributes:
      }
    }
  end
end
