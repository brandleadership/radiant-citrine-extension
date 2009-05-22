module CitrineTags

  include Radiant::Taggable

  desc %{
    *Usage:*
    <r:is_tree_depth depth="" />
  }
  tag 'is_tree_depth' do |tag|
     reverse_depth = 0;
     active_page = tag.locals.page
     while active_page.parent != nil
       reverse_depth += 1
       active_page = active_page.parent
     end

     tag.expand if tag.attr['depth'].to_i - reverse_depth == 0
  end

  desc %{
    *Usage:*
    <r:unless_tree_depth depth="" />
  }
  tag 'unless_tree_depth' do |tag|
     reverse_depth = 0;
     active_page = tag.locals.page
     while active_page.parent != nil
       reverse_depth += 1
       active_page = active_page.parent
     end

     tag.expand unless tag.attr['depth'].to_i - reverse_depth == 0
  end

  desc %{
    Does expand a tag just once per session otherwise it returns the previous result.

    Usage: <r:once_per_session property="[name of session property]" />
  }
  tag 'once_per_session' do |tag|
    property = tag.attr['property']
    if property == nil
      return
    end
    if @request.session[property] == nil
      @request.session[property] = tag.expand
    else
      @request.session[property]
    end
  end

  tag "gallery:items:pagination" do |tag|
    html = '<ul>'
    item_counter = 1;
    gallery = find_gallery(tag)
    gallery.items.find(:all).each do |item|
      if (item == @current_item || (@current_item == nil && item == gallery.items.find_by_position(1)))
        html += '<li class="currentItem">' + item_counter.to_s + '</li>'
      else
        href = File.join(tag.render('url'), @current_gallery.url(gallery), "#{item.id}.#{item.extension}/show")
        html += '<li><a href="' + href + '">'  + item_counter.to_s + '</a></li>'
      end
      item_counter = item_counter + 1
    end
    html += "</ul>"
    html
  end

end
