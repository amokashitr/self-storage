module ImageSetter

  def update_with_images(image_ids, object_params)
    unless image_ids.nil?
      image_ids.each do |image_id|
        self.images.find_by(blob_id: image_id).purge
      end
    end
    return self.update(object_params)
  end

end