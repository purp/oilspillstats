# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_timelines_session',
  :secret      => 'e0ad48d41e03890f9c59eab44c4f2cbc635c3f949098c34639882f1003768539f1bc075bc0847d23bd29f4a6142591f6c3d347f20208af02d4a13371e6f691f0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
