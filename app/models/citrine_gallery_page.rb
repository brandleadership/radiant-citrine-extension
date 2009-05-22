class CitrineGalleryPage < GalleryPage

  def find_gallery_by_path(slug)
	slugs = slug.split('/')
	current_gallery = nil
	if slug == ''
      current_gallery = Gallery.find_by_id(self.base_gallery_id)
	end
	while slug = slugs.shift do
  	  unless current_gallery
	    current_gallery = Gallery.find_by_slug(slug)
	  else
	    current_gallery = current_gallery.children.find_by_slug(slug)
	  end
	  break unless current_gallery
	end
	current_gallery
  end
end