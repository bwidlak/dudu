# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_marcin_session',
  :secret      => 'c3c840d4e6be7fa9458d0028082a585599e428ffa9793426619bccc344ce8636b1da4728168cd0209f2b0e6ee2f0d8cfba9b32e1e3427d2609de0a278d020204'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
