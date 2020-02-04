module DiscountsHelper
	def button_to_add_address(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    button_tag(name, type: 'button', class: "add_address", data: {id: id, fields: fields.gsub("\n", "")})
    #link_to(name, '#', class: "add_address", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
