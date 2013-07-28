class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  def store_dir
    [model.class.to_s.underscore, mounted_as, model.id].join("/")
  end

  version :small do
    resize_to_fit nil, 100
  end
end
