module Jekyll
  class CategoryArchiveTag < Liquid::Tag
    def render(context)
      html = ""
      
      # Get categories and sort biggest-first
      for category in context.registers[:site].categories.sort_by { |category| -category[1].length }
        html << "<li class='post'><a href='/blog/category/#{category[0].gsub(' ','-')}'>#{category[0]} (#{category[1].length})</a></li>"
      end
 
      # Write out the html
      html
    end
  end
end
 
Liquid::Template.register_tag('category_archive', Jekyll::CategoryArchiveTag)
