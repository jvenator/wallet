if !Rails.env.production?
  config = YAML.load_file(Rails.root.join("config", "services.yml"))
  ENV['DROPBOX_APP_KEY'] = config["dropbox"]["app_key"]
  ENV['DROPBOX_APP_SECRET'] = config["dropbox"]["app_secret"]
  ENV['DROPBOX_ACCESS_TYPE'] = 'app_folder'
end



