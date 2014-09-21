# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
secret = Rails.env.production? ? ENV['SECRET_TOKEN'] : 'ce664fd93823b32177aaaf757e32505a1eda4fa1e036819558ce526d6abbddae08d0f22b8db4a17b86e9548809ad632b814937c1847e85adefa83fd47731d8ae'
BackboneLabank::Application.config.secret_key_base = secret
