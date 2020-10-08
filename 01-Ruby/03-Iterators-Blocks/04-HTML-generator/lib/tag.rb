def tag(tag_name, attributes = nil)
  # TODO: Build HTML tags around content given in the block
  #       The method can be called with an optional HTML attribute inputted as [attr_name, attr_value]
  specific_html_tag = ""
  if !attributes.nil?
    content = yield(tag_name, attributes)
    specific_html_tag = "<#{tag_name} #{attributes[0]}=\"#{attributes[1]}\">#{content}</#{tag_name}>"
  else
    content = yield(tag_name)
    specific_html_tag = "<#{tag_name}>#{content}</#{tag_name}>"
  end
  return specific_html_tag
end
