require 'yaml'
if !Rails.env.production?
  config = YAML.load_file(Rails.root.join("config", "services.yml"))
  ENV['S3_KEY'] = config["s3"]["key"]
  ENV['S3_SECRET'] = config["s3"]["secret"]
end