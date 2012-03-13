CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAINJ6HA3PY44KIGZA',       # required
    :aws_secret_access_key  => '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'    # required
    # :region                 => 'eu-west-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'renters-wallet-documents'                     # required
  # config.fog_host       = 'https://assets.example.com'            # optional, defaults to nil
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end