# Steal another markdown/html file from the web and insert it inline.
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
      lines = open(@url).readlines
      lines = lines[(@linesToSkip.to_i)..-1]
      lines.join
    end
  end
end

Liquid::Template.register_tag('steal', Steal::CodeTag)
