class CharityAvatarUploader < CarrierWave::Uploader::Base
  def store_dir
    'public/charity_photos'
  end

  def extension_white_list
    %w(jpg jpeg gif png JPG JPEG GIF PNG)
  end
end
