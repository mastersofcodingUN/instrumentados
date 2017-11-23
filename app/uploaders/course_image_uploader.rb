class CourseImageUploader < CarrierWave::Uploader::Base
  
  include CarrierWave::MiniMagick
  
  # Choose what kind of storage to use for this uploader:
  storage :file

  def default_url
    "guitarra-bateria.jpg"
  end
  
  process resize_to_fill: [160, 180]
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg png)
  end
end