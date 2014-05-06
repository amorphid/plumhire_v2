Rails.application.configure do
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.active_record.migration_error = :page_load
  config.active_support.deprecation = :log
  config.assets.debug = true
  config.assets.raise_runtime_errors = true
  config.cache_classes = false
  config.consider_all_requests_local = true
  config.eager_load = false
end

# carrierwave config for upload to s3 (start)
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => ENV["FOG_PROVIDER"],
      :aws_access_key_id      => ENV["AWS_ACCESS_KEY_ID"],
      :aws_secret_access_key  => ENV["AWS_SECRET_ACCESS_KEY"]
    }

    config.storage = :fog
    config.fog_directory = ENV["AWS_S3_BUCKET"]
  end
# carrierwave config for upload to s3 (end)
