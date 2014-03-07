class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  resize_to_limit nil, 800

  version :medium do
    resize_to_limit nil, 500
  end

  version :small do
    resize_to_limit nil, 200
  end
end
