# See DropboxClient for available file methods on @client. i.e. get_file, put_file, account_info
require 'dropbox_sdk'
require 'forwardable'
class DropboxApi
   extend Forwardable
   attr_accessor :client

   def initialize(dropbox_user)
     #TODO Should do a quick check to see if keys still valid? What to do if not?
     session = DropboxSession.new(ENV['DROPBOX_APP_KEY'], ENV['DROPBOX_APP_SECRET'])
     session.set_access_token(dropbox_user.access_key, dropbox_user.access_secret)
     client = DropboxClient.new(session, ENV['DROPBOX_ACCESS_TYPE'])
     @client = client

     # Just delegate all DropboxClient methods to @client for now.
     (class << self; self; end).class_eval do
       def_delegators :'@client', *client.public_methods(false)
     end
   end

end