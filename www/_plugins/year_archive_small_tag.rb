module Jekyll
  class YearArchiveSmallTag < Liquid::Tag
    def render(context)
      html = ""
      yearData = Hash.new

      # Get range of years for which there are posts
      posts = context.registers[:site].posts
      firstYear = posts[0].date.year
      lastYear = posts[posts.size-1].date.year

      # Build up a map of {year => number of posts that year}
      for year in firstYear..lastYear
        yearData[year] = posts.select{ |post| post.date.year == year }.size
      end

      # Build the html items
      yearData.sort.reverse_each { |year, numPosts|
        if numPosts > 0
          html << "<a href='/blog/#{year}'>#{year}</a> "
        end
      }

      # Write out the html
      html
    end
  end
end

Liquid::Template.register_tag('year_archive_small', Jekyll::YearArchiveSmallTag)
