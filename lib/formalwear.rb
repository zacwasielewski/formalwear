module Formalwear
  autoload :FormBuilder, 'formalwear/form_builder'
  autoload :Railtie,     'formalwear/railtie'
  autoload :VERSION,     'formalwear/version'
end

def formalwear_form_for(*args, &block)
  options = args.extract_options!
  options.merge!(:builder => Formalwear::FormBuilder)
  options[:html] ||= {}
  options[:html].reverse_merge! :role => 'form'  
  form_for(*(args + [options]), &block)
end

def formalwear_fields_for(record_name, record_object = nil, options = {}, &block)
  options.merge!(:builder => Formalwear::FormBuilder)
  fields_for(record_name, record_object, options, &block)
end
