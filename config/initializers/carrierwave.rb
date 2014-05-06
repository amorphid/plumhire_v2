# carrierwave config for upload to s3 (start)
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => ENV["FOG_PROVIDER"],
      :aws_access_key_id      => ENV["AWS_ACCESS_KEY_ID"],
      :aws_secret_access_key  => ENV["AWS_SECRET_ACCESS_KEY"]
    }

    config.storage = :fog
    config.fog_directory = ENV["AWS_S3_BUCKET"]


    if Rails.env.test? or Rails.env.cucumber?
      config.storage = :file
      config.enable_processing = false
    end
  end
# carrierwave config for upload to s3 (end)
