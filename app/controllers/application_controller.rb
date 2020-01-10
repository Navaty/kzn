class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def custom_paginate_renderer
  # Return nice pagination for materialize
  	Class.new(WillPaginate::ActionView::LinkRenderer) do
	  def container_attributes
	    {class: "paginator d-flex justify-content-center"}
	  end

	  def page_number(page)
	    if page == current_page
	      "<li class=\"list-inline-item circle paginator-item-active\">"+link(page, page, rel: rel_value(page))+"</li>"
	    else
	      "<li class=\"list-inline-item paginator-item\">"+link(page, page, rel: rel_value(page))+"</li>"
	    end
	  end

	  def previous_page
	    num = @collection.current_page > 1 && @collection.current_page - 1
	    previous_or_next_page(num, "<img src=\"assets/paginatorprev.svg\">")
	  end

	  def next_page
	    num = @collection.current_page < total_pages && @collection.current_page + 1
	    previous_or_next_page(num, "<i class=\"\"><img src=\"assets/paginatornext.svg\"></i>")
	  end

	  def previous_or_next_page(page, text)
	    if page
	      "<li class=\"list-inline-item pag-arr\">"+link(text, page)+"</li>"
	    else
	      "<li class=\"list-inline-item pag-arr\">"+text+"</li>"
	    end
	  end
  	end
end
end
