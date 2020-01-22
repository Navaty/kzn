module SlidersHelper
	def build_carousel
		Carousel.new(self).html

	end
	class Carousel

	    def initialize(view)
	      @sliders = Slider.all.order('Position')
	      @view = view
	    end

	    def html
	      content = safe_join([indicators, slides, controls])
	      content_tag(:div, content, {id: 'carousel-example-2', class: 'carousel news-carousel slide carousel-fade', data: {ride:'carousel'}})
	    end

	    private
		attr_accessor :view
	    delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view


		def indicators
		  items = @sliders.count.times.map { |index| indicator_tag(index) }
		  content_tag(:ol, safe_join(items), class: 'carousel-indicators')
		end

		def indicator_tag(index)
		  options = {
		    class: (index.zero? ? 'active' : ''),
		    data: { 
		      target: 'carousel-example-2', 
		      slide_to: index
		    }
		  }

		  content_tag(:li, '', options)
		end
	 
		def slides
		  items = @sliders.map.with_index { |slider, index| slide_tag(slider, index.zero?) }
		  content_tag(:div, safe_join(items), class: 'carousel-inner', role: 'listbox')
		end

		def slide_tag(slider, is_active)
		  options = {
		    class: (is_active ? 'carousel-item active' : 'carousel-item'),
		  }
		  image = image_tag(slider.image_url, class: 'd-block w-100')
		  mask = content_tag(:div,'',{class: 'mask rgba-black-slight', alt: 'slider slide'})
		  icontent = content_tag(:div, safe_join([image,mask]), {class: 'view'})
		  title = content_tag(:h3, slider.title, class: 'h3-responsive')
		  description = content_tag(:p, slider.description)
		  tcontent = content_tag(:div, safe_join([title, description]), class: 'carousel-caption')
		  content_tag(:div, link_to(safe_join([icontent, tcontent]), slider.url, :target => "_blank"), options)
		  #		  content_tag(:div, safe_join([icontent, tcontent]), options)
		end

		def controls
		  safe_join([control_tag('prev'), control_tag('next')])
		end

		def control_tag(direction)
		  options = {
		    class: "carousel-control-#{direction}",
		    role: 'button',
		    data: { slide: direction }
		  }
		  icon = content_tag(:span, '', {class: "carousel-control-#{direction}-icon", aria: {hidden: "true"}})
		  sr = content_tag(:span, direction, class: "sr-only")

		  control = link_to(safe_join([icon,sr]), "#carousel-example-2", options)
		end


	end

end


