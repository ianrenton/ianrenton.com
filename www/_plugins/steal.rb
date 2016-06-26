# Steal another markdown/html file from the web and insert it inline.
# As a side-effect it also caches the result outside of the 'www' directory,
# and later uses files from there if present.
# Params: URL, lines-to-skip
# Lines to skip implemented to strip the first heading off GitHub READMEs.

require 'cgi'
require 'open-uri'
require 'liquid'

module Steal
  class CodeTag < ::Liquid::Tag

    def initialize(tag_name, params, tokens)
      @linesToSkip = "0"
      @url, @linesToSkip = params.split
      super
    end

    def render(context)
      # Locate appropriate cache file
      filepath = '../stealcache/' + CGI::escape(@url)
      
      if File.file?(filepath)
        # If file already exists, use the contents
        result = IO.read(filepath)
      
      else
        # If not, download content from the web instead
        lines = open(@url).readlines
        lines = lines[(@linesToSkip.to_i)..-1]
        result = lines.join
        
        # Write downloaded content to file
        File.open(filepath, 'w') { |file| file.write(result) }
      end
      
      # Return the markdown content so it gets rendered
      result
    end
  end
end

Liquid::Template.register_tag('steal', Steal::CodeTag)
