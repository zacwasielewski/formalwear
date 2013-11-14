require 'formalwear'
require 'action_view/helpers'

class Formalwear::FormBuilder < ActionView::Helpers::FormBuilder

  def group(options = nil)
    options ||= {}
    classes = merge_wordlists( options[:class], 'form-group')
    options.merge!( :class => classes )
    @template.content_tag(:div, nil, options) do
      if block_given?
        yield
      end
    end
  end

  def label(method, text = nil, options = {}, &block)
    classes = merge_wordlists( options[:class], 'control-label')
    options.merge! :class => classes
    super
  end

  def static
    options = {:class => 'form-control-static'}
    @template.content_tag(:p, nil, options) do
      if block_given?
        yield
      end
    end
  end
  
  def text_field(name, options = nil)
    options ||= {}
    classes = merge_wordlists( options[:class], 'form-control')
    options.reverse_merge! :class => classes
    super
  end

  def email_field(name, options = nil)
    options ||= {}
    classes = merge_wordlists( options[:class], 'form-control')
    options.reverse_merge! :class => classes
    super
  end
  
  def password_field(name, options = nil)
    options ||= {}
    classes = merge_wordlists( options[:class], 'form-control')
    options.reverse_merge! :class => classes
    super
  end

private
  
  def merge_wordlists(list1 = nil, list2 = nil, delim = nil)
    delim ||= " "
    list1 ||= ""
    list2 ||= ""
    [list1.split(delim), list2.split(delim)].flatten.uniq.join(delim)
  end

end