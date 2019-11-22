module ApplicationHelper
	def build_bredcrumb(sale)
		result=[]
		sale.ancestors.each do |ancestor|
			result << content_tag(:li, class: "breadcrumb-item") do
				link_to(ancestor.name, ancestor)
			end
		end
		result<< content_tag(:li, sale.name, class:"breadcrumb-item active")
		result.join('').html_safe
	end
end
