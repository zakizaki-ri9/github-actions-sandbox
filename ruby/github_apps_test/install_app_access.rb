require 'pp'
require 'json'
require 'httpclient'
require 'openssl'
require 'jwt'  # https://rubygems.org/gems/jwt
require 'dotenv/load' # Manages environment variables

def generate_jwt
  # Private key contents
  private_key = OpenSSL::PKey::RSA.new(ENV['PRIVATE_KEY'].gsub('\n', "\n"))

  # Generate the JWT
  payload = {
    # issued at time, 60 seconds in the past to allow for clock drift
    iat: Time.now.to_i - 60,
    # JWT expiration time (10 minute maximum)
    exp: Time.now.to_i + (10 * 60),
    # GitHub App's identifier
    iss: ENV['APP_IDENTIFIER']
  }

  JWT.encode(payload, private_key, "RS256")
end

def generate_install_app_acccess_token
  client = HTTPClient.new
  # debug に必要なら有効化
  # client.debug_dev = $stderr

  res = client.post(
    "https://api.github.com/app/installations/#{ENV['INSTALLATION_ID']}/access_tokens",
    header: {
      'Authorization': "Bearer #{generate_jwt}",
      'Accept': 'application/vnd.github.v3+json',
    },
  )
  
  body = JSON.parse(res.body)
  body['token']
end

url = 'https://api.github.com/installation/repositories'
res = HTTPClient.new.get(
  url,
  header: {
    'Authorization': "token #{generate_install_app_acccess_token}",
    'Accept': 'application/vnd.github.v3+json',
  }
)

pp "url: #{url}"
pp "status: #{res.status}"
pp "total_count: #{JSON.parse(res.body)['total_count']}"
