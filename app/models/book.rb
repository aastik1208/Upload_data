class Book < ApplicationRecord
  has_many_attached :images
  validate :image_type

  private
    def image_type
      if images.attached? == false
        errors.add(:images, "wooz woozie")
      end
      images.each do |image|
        if !image.content_type.in?(%(image.jpeg image/png))
          errors.add(:images, "suck up")
        end
      end
    end
end
