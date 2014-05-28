module ApplicationHelper



  def flash_messages

    flashes = ""

    flash.each do |type, value|
      flashes += content_tag(:div, value, class: flash_class(type.to_sym))
    end

    content_tag(:div, flashes.html_safe)

  end

  def flash_class(type)
    case type
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :alert then "alert alert-danger"
    end
  end

  #name => label of button
  #f    => form object
  #association => nested_attributes e.g. reward_levels
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).new
    id         = new_object.object_id
    # f.field_for :reward_levels
    fields = f.fields_for(association, new_object, child_index: id) do |rl|
      render(association.to_s.singularize + "_fields", f: rl)
    end
    link_to(name, "javascript:void(0)", class: "add_fields btn btn-default", 
      data: {id: id, fields: fields.gsub("\n", "")})
  end


  def generate_gmap4rails_markers(objects)
    Gmaps4rails.build_markers(objects) do |object, marker| 
      object.decorate.gen_marker(marker) 
    end
  end

end
