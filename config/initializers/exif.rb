require 'exifr/jpeg'

module ActiveStorage
  class Analyzer::ImageAnalyzer < Analyzer
    def metadata
      read_image do |image|
        if rotated_image?(image)
          { width: image.height, height: image.width }
        else
          { width: image.width, height: image.height }
        end.merge(gps_from_exif(image) || {})
      end
    rescue LoadError
      logger.info "Skipping image analysis because the mini_magick gem isn't installed"
      {}
    end

    private

    def gps_from_exif(image)
      return unless image.type == 'JPEG'

      if exif = EXIFR::JPEG.new(image.path).exif
        if gps = exif.fields[:gps]
          {
            latitude:  gps.fields[:gps_latitude].to_f,
            longitude: gps.fields[:gps_longitude].to_f,
            
          }
        end
      end
    rescue EXIFR::MalformedImage, EXIFR::MalformedJPEG
    end
  end
end