require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'dotenv'

Dotenv.load

# Paymongo Template
class Paymongo
  def initialize
    @response_checkout_url = nil
    @response_source_id = nil
  end

  def gcash_auth(base_url:, params:)
    response = request_response(base_url:, params:)
    @response_checkout_url = response['data']['attributes']['redirect']['checkout_url']
    @response_source_id = response['data']['id']
    response
  end

  def payment(base_url:, params:)
    request_response(base_url:, params:)
  end

  def checkout_url
    @response_checkout_url
  end

  def source_id
    @response_source_id
  end

  private

  def details(attributes:)
    {
      data: {
        attributes:
      }
    }
  end

  def request_response(base_url:, params:)
    url = URI(base_url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(url)

    request_body = details(attributes: params[:attributes])
    request['Accept'] = ENV['ACCEPT']
    request['Content-Type'] = ENV['CONTENT_TYPE']
    request['Authorization'] = ENV['AUTHORIZATION']
    request.body = request_body.to_json

    response = http.request(request)

    JSON.parse(response.read_body)
  end
end
