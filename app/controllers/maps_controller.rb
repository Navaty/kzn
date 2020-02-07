class MapsController < ApplicationController
	layout 'map', :only => :index
	def index
	end

	def tabdiscounts

		respond_to do |format|
			format.html{
			}
			format.json {
	       	@hash = {:type => "FeatureCollection"}
	       	@hash.merge!(get_markers(maps_params))
	  
	        render json: @hash
	      }
		end
	end

private
	def get_markers(par) 
		@result = {:features => []}
		case par[:type] #D - discount P-places S-sales E-events
		when "D" # Похоже, что решение хуже чем у S и P Попробуй потом
		        pluck_fields = DiscountAddress.pluck(:latitude, :longitude, :discount_id, :id)
		        pluck_fields.each do |a|
	        		b = Discount.find(a[2])
		        	(@result[:features]||={}) << {'type' => "Feature", 'id' => a[3], 'geometry' => {:type => 'Point', :coordinates => a[0,2] },
		        	 :properties => {:balloonContentHeader =>
		        	  "<a target='_blank' href='#{discount_path(b)}'><img src='#{b.images_urls[0]}'  width=300px height=150px></a>",
		        	   :balloonContentBody => 
		        	   "<font size=5><b><a style = 'color:black;' target='_blank' href='#{discount_path(b)}'>#{b.title}</a></b></font>", 
		        	   :balloonContentFooter => "<font size=1>Информация предоставлена: </font> <strong>этим балуном</strong>", 
		        	   :clusterCaption => "<strong><s>Еще</s> одна</strong> метка", 
		        	   :hintContent => "<strong>Текст  <s>подсказки</s></strong>"}
	        	}
	    	end
	    	return @result

		when 'S'
			if par[:id]
				discounts = Discount.where(sale_id: [Sale.find(par[:id]).subtree_ids]).active
				discounts.each do |discount|
					discount.discount_addresses.each do |addr|
			        	(@result[:features]||={}) << {'type' => "Feature", 'id' => addr[:id], 'geometry' =>
			        	 {:type => 'Point', :coordinates => [addr[:latitude],addr[:longitude]] },
			        	 :properties => {:balloonContentHeader =>
			        	  "<a target='_blank' href='#{discount_path(discount)}'><img src='#{discount.images_urls[0]}'  width=300px height=150px></a>",
			        	   :balloonContentBody => 
			        	   "<font size=5><b><a style = 'color:black;' target='_blank' href='#{discount_path(discount)}'>#{discount.title}</a></b></font>", 
			        	   :balloonContentFooter => "<font size=1>Информация предоставлена: </font> <strong>этим балуном</strong>", 
			        	   :clusterCaption => "<strong><s>Еще</s> одна</strong> метка", 
			        	   :hintContent => "<strong>Текст  <s>подсказки</s></strong>"}
		        	}
		        	end
		    	end
		    end
	    	return @result
	    	
		when 'P'
			# pluck_fields = Place.pluck(:latitude, :longitude, :, :id)
				places = Place.active
		        places.each do |a|
		        	if a[:latitude].present? && a[:longitude].present?
		        	(@result[:features]||={}) << {'type' => "Feature", 'id' => a[:id],
		        	 'geometry' => {:type => 'Point', :coordinates => [a[:latitude],a[:longitude]] },
		        	 :properties => {:balloonContentHeader => 
		        	 	"<a style = 'color:black;' target='_blank' href='#{place_path(a)}'><img src='#{a.images_urls[0]}'  width=300px height=150px></a>",
		        	   :balloonContentBody => 
		        	   "<font size=5><b><a style = 'color:black;' target='_blank' href='#{place_path(a)}'>#{a.title}</a></b></font>", 
		        	   :balloonContentFooter => "<font size=1>Информация предоставлена: </font> <strong>этим балуном</strong>", 
		        	   :clusterCaption => "<strong><s>Еще</s> одна</strong> метка", 
		        	   :hintContent => "<strong>Текст  <s>подсказки</s></strong>"}
	        		}
	        	end
	    	end
	    	return @result

		when 'E'

			if par[:id]
				places = Place.where(event_id: [Event.find(par[:id]).subtree_ids]).active
		        places.each do |a|
		        	if a[:latitude].present? && a[:longitude].present?
		        	(@result[:features]||={}) << {'type' => "Feature", 'id' => a[:id],
		        	 'geometry' => {:type => 'Point', :coordinates => [a[:latitude],a[:longitude]] },
		        	 :properties => {:balloonContentHeader => 
		        	 	"<a style = 'color:black;' target='_blank' href='#{place_path(a)}'><img src='#{a.images_urls[0]}'  width=300px height=150px></a>",
		        	   :balloonContentBody => 
		        	   "<font size=5><b><a style = 'color:black;' target='_blank' href='#{place_path(a)}'>#{a.title}</a></b></font>", 
		        	   :balloonContentFooter => "<font size=1>Информация предоставлена: </font> <strong>этим балуном</strong>", 
		        	   :clusterCaption => "<strong><s>Еще</s> одна</strong> метка", 
		        	   :hintContent => "<strong>Текст  <s>подсказки</s></strong>"}
	        		}
	        		end
	    		end
		    end
	    	return @result

		else
			pluck_fields = DiscountAddress.pluck(:latitude, :longitude, :discount_id, :id)
		        pluck_fields.each do |a|
	        		b = Discount.find(a[2])
		        	(@result[:features]||={}) << {'type' => "Feature", 'id' => "d#{a[3]}", 'geometry' => {:type => 'Point', :coordinates => a[0,2] },
		        	 :properties => {:balloonContentHeader =>
		        	  "<a target='_blank' href='#{discount_path(b)}'><img class='offers_elem img-fluid' src='#{b.images_urls[0]}'  width=300px height=150px></a>",
		        	   :balloonContentBody => 
		        	   "<font size=4><b><a style = 'color:black;' class='offers_elem_text' target='_blank' href='#{discount_path(b)}'>#{b.title}</a></b></font>", 
		        	   :balloonContentFooter => "<font size=1>Информация предоставлена: </font> <strong>этим балуном</strong>", 
		        	   :clusterCaption => "<strong><s>Еще</s> одна</strong> метка", 
		        	   :hintContent => "<strong>Текст  <s>подсказки</s></strong>"}
	        	}
	    	end
	    	places = Place.all
		        places.each do |a|
		        	if a[:latitude].present? && a[:longitude].present?
		        	(@result[:features]||={}) << {'type' => "Feature", 'id' => "p#{a[:id]}",
		        	 'geometry' => {:type => 'Point', :coordinates => [a[:latitude],a[:longitude]] },
		        	 :properties => {:balloonContentHeader => 
		        	 "<a target='_blank' href='#{place_path(a)}'><img class='offers_elem img-fluid' src='#{a.images_urls[0]}'  width=300px height=150px></a>",
		        	  :balloonContentBody => 
		        	  "<font size=4><b><a style = 'color:black;' target='_blank' href='#{place_path(a)}'>#{a.title}</a></b></font>", 
		        	  :balloonContentFooter => "<font size=1>Информация предоставлена: </font> <strong>этим балуном</strong>", 
		        	  :clusterCaption => "<strong><s>Еще</s> одна</strong> метка", 
		        	  :hintContent => "<strong>Текст  <s>подсказки</s></strong>"}
	        		}
	        	end
	    	end

			return @result
		end
	end
	def maps_params
		params.require(:map).permit(:type,:id)
	end

end
