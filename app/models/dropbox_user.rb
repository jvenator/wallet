class DropboxUser < ActiveRecord::Base
  attr_accessible :access_key, :access_secret, :uid
  has_one :user


  def api
     @api ||= DropboxApi.new(self)
  end

  def list_all_files
     api.list_all_files
  end

  def upload_file(name, file)
    api.upload_file(name, file)
  end

  def get_file(name)
    api.get_file(name)
  end

end
