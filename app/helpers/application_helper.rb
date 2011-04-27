module ApplicationHelper
  
  
=begin
the following three methods come from the chrisblunt.com website
http://chrisblunt.com/2009/10/12/rails-getting-the-id-of-form-fields-inside-a-fields_for-block/
=end
  # app/helpers/application_helper.rb
def sanitized_object_name(object_name)
  object_name.gsub(/\]\[|[^-a-zA-Z0-9:.]/,"_").sub(/_$/,"")
end
 
def sanitized_method_name(method_name)
  method_name.sub(/\?$/, "")
end
 
def form_tag_id(object_name, method_name)
  "#{sanitized_object_name(object_name.to_s)}_#{sanitized_method_name(method_name.to_s)}"
end

def form_object_index(object_name)
  object_name.match(/[0-9]/)
end
end
