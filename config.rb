require 'byebug'
set :css_dir, 'assets'
set :js_dir, 'assets'
set :images_dir, 'images'
set :partials_dir, 'partials'

ignore /bower_components/
configure :development do
  activate :livereload
end

set :url_root, 'https://www.electoralcollegetracker.com/'
set :haml, {escape_attrs: false}

# Configuration code for Middleman AWS S3 Sync
activate :s3_sync do |config|
  # This shd be overridden by the CLI parameter
  config.bucket                     = ENV['AWS_S3_BUCKET'] # The name of the S3 bucket you are targetting.
  config.region                     = 'us-west-2'     # The AWS region for your bucket.
  config.aws_access_key_id          = ENV['AWS_S3_ID']
  config.aws_secret_access_key      = ENV['AWS_SECRET_KEY']
end

