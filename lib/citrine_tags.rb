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


end
