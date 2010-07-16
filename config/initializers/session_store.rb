# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_babynames_session',
  :secret      => '279dae322d68b89fe95b62c06daf2e2bf9247b818fa5fa8616b40cbbaa4a8e967bfac80704a59b352248094855e70f5be492b66c1142b0fa996fb44c1fe32679'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
