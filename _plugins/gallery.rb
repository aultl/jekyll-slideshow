
module Jekyll
  class SlideshowTag < Liquid::Tag

    Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/

    def initialize(tag_name, markup, tokens)
      super

      if markup =~ Syntax then
        d = $1

        if $2.nil? then
            width = 100
            height = 360
        else
            width = $2.to_i
            height = $3.to_i
        end
      else
        raise "No image directory provided in the \"#{tag_name}\" tag"
      end

      # Error if directory does not exist
      if ! Dir.exists?("#{Dir.getwd}#{d}") then
        raise "Specified image directory #{d} does not exist!"
      else
        images = Array.new
        @slideshow = ''

        # loop through directory contents
        for item in Dir.entries("#{Dir.getwd}#{d}") do
          next if item == '.' or item == '..'
          # only include images
          if (File.extname(item).downcase == ('.jpg' || '.png')) then
            images << item
          end
        end

        # loop through images
        c = 0
        images.each do |i|
          c = c + 1
          @slideshow = @slideshow + "<div class=\"mySlides fade\"><div class=\"numbertext\">#{c} / #{images.count}</div><img src=\"#{d}/#{i}\" style=\"width=100%\"></div>\n"
        end
          # add controls
          @slideshow = @slideshow + "<a class=\"prev\" onclick=\"plusSlides(-1)\">&#10094;</a>\n<a class=\"next\" onclick=\"plusSlides(1)\">&#10095;</a>"
      end
    end

    def render(context)
      "<div class=\"slideshow-container\">#{@slideshow}</div>"
    end

    Liquid::Template.register_tag('slideshow', Jekyll::SlideshowTag)

  end
end
