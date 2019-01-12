# frozen_string_literal: true

Knock.setup do |config|
  ## How long before a token is expired. If nil is provided, token will
  config.token_lifetime = 1.hour

  ## Configure the audience claim to identify the recipients that the token
  ## is intended for.
  # config.token_audience = nil

  ## If using Auth0, uncomment the line below
  # config.token_audience = -> { Rails.application.secrets.auth0_client_id }

  ## Configure the algorithm used to encode the token
  config.token_signature_algorithm = 'HS256'

  ## Configure the key used to sign tokens.
  config.token_secret_signature_key = -> { Rails.application.credentials.read }

  ## If using Auth0, uncomment the line below
  # config.token_secret_signature_key = -> { JWT.base64url_decode Rails.application.secrets.auth0_client_secret }
end
