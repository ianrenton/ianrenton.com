# LaTeX to MathML converter from
# https://github.com/tmthrgd/jekyll-plugins
# to remove need for MathJax JS

module MathML
	if system "which tex2mml >/dev/null 2>&1"
		def self.parse tex, block
			IO.popen(["tex2mml", *(block ? [] : ["--inline"]), "--semantics", tex]).read.strip
		end
	else
		begin
			require "itextomml"
			
			def self.parse tex, block
				@parser ||= Itex2MML::Parser.new
				block ? @parser.block_filter(tex) : @parser.inline_filter(tex)
			end
		rescue LoadError
			begin
				require "ritex"
			rescue LoadError
				STDERR.puts "You are missing a library required for mathml. Please run either:"
				STDERR.puts " $ [sudo] npm install [-g] https://github.com/mathjax/MathJax-node/tarball/master"
				STDERR.puts "or:"
				STDERR.puts " $ [sudo] gem install itextomml"
				STDERR.puts "or:"
				STDERR.puts " $ [sudo] gem install ritex"
				raise Errors::FatalException.new "Missing dependency: MathJax-node, itextomml or ritex"
			end
			
			def self.parse tex, block
				@parser ||= Ritex::Parser.new
				@parser.parse tex, { :display => block }
			end
		end
	end
end

class Jekyll::MathML < Liquid::Block
	def initialize tag_name, markup, tokens
		@attributes = {
			:display => "block"
		}
		
		markup.scan(Liquid::TagAttributes) { |key, value| @attributes[key.to_sym] = value }
		
		super
	end
	
	def render context
		MathML.parse super.to_s, !@attributes[:display].eql?("inline")
	end
end

Liquid::Template.register_tag "math", Jekyll::MathML

# Kramdown math support
begin
	require "kramdown"
	
	if Kramdown::VERSION < '1.7.0'
		class Kramdown::Converter::Html
			def convert_math el, indent
				block = el.options[:category].eql? :block
				
				attr = el.attr.dup
				attr.delete "display"
				attr.delete "xmlns"
				
				mathml = MathML.parse el.value, block
				mathml.insert "<math".length, html_attributes(attr)
				
				block ? "#{" " * indent}#{mathml}\n" : mathml
			end
		end
	else
		# Use `math_engine: mathjaxnode` for 1.7+
	end
rescue LoadError
end