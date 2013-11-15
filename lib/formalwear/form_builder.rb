require 'formalwear'
require 'action_view/helpers'

class Formalwear::FormBuilder < ActionView::Helpers::FormBuilder

  def formalwear_fields_for(record_name, record_object = nil, options = {}, &block)
    options.merge!(:builder => Formalwear::FormBuilder)
    fields_for(record_name, record_object, options, &block)
  end

  def group(options = nil)
    options ||= {}
    classes = merge_classes( options[:class], 'form-group')
    options.merge!( :class => classes )
    @template.content_tag(:div, nil, options) do
      if block_given?
        yield
      end
    end
  end

  def label(method, text = nil, options = nil, &block)
    options ||= {}
    classes = merge_classes( options[:class], 'control-label')
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
  
  def text_field(method, options = nil)
    options ||= {}
    classes = merge_classes( options[:class], 'form-control')
    options.reverse_merge! :class => classes
    super
  end

  def email_field(method, options = nil)
    options ||= {}
    classes = merge_classes( options[:class], 'form-control')
    options.reverse_merge! :class => classes
    super
  end
  
  def password_field(method, options = nil)
    options ||= {}
    classes = merge_classes( options[:class], 'form-control')
    options.reverse_merge! :class => classes
    super
  end

  def text_field_group(method, text = nil, options = nil, label_options = nil, control_options = nil)
    options         ||= {}
    label_options   ||= {}
    control_options ||= {}
    if label_grid = label_options.delete(:grid)
      classes = merge_classes( label_options[:class], grid_classes(label_grid))
      label_options[:class] = classes
    end
    if control_grid = control_options.delete(:grid)
      classes = merge_classes( control_options[:class], grid_classes(control_grid))
      control_wrapper_class = classes
    end
    group(options) do
      html = ""
      html += label(method, text, label_options)
      if control_grid
        html += @template.content_tag(:div, nil, { :class => control_wrapper_class }) { text_field(method, control_options) }
      else
        html += text_field(method, control_options)
      end
      html.html_safe
    end
  end

  def email_field_group(method, text = nil, options = nil, label_options = nil, control_options = nil)
    options         ||= {}
    label_options   ||= {}
    control_options ||= {}
    if label_grid = label_options.delete(:grid)
      classes = merge_classes( label_options[:class], grid_classes(label_grid))
      label_options[:class] = classes
    end
    if control_grid = control_options.delete(:grid)
      classes = merge_classes( control_options[:class], grid_classes(control_grid))
      control_wrapper_class = classes
    end
    group(options) do
      html = ""
      html += label(method, text, label_options)
      if control_grid
        html += @template.content_tag(:div, nil, { :class => control_wrapper_class }) { email_field(method, control_options) }
      else
        html += email_field(method, control_options)
      end
      html.html_safe
    end
  end

  def password_field_group(method, text = nil, options = nil, label_options = nil, control_options = nil)
    options         ||= {}
    label_options   ||= {}
    control_options ||= {}
    if label_grid = label_options.delete(:grid)
      classes = merge_classes( label_options[:class], grid_classes(label_grid))
      label_options[:class] = classes
    end
    if control_grid = control_options.delete(:grid)
      classes = merge_classes( control_options[:class], grid_classes(control_grid))
      control_wrapper_class = classes
    end
    group(options) do
      html = ""
      html += label(method, text, label_options)
      if control_grid
        html += @template.content_tag(:div, nil, { :class => control_wrapper_class }) { password_field(method, control_options) }
      else
        html += password_field(method, control_options)
      end
      html.html_safe
    end
  end

private
  
  def merge_classes(a = nil, b = nil, delim = nil)
    delim ||= " "
    a ||= ""
    b ||= ""
    [a.split(delim), b.split(delim)].flatten.uniq.join(delim)
  end
  
  def grid_classes(grid = nil)
    grid ||= {}
    classes = []
    classes << 'col-sm-'+grid[:sm].to_s if grid[:sm].is_a? Integer
    classes << 'col-md-'+grid[:md].to_s if grid[:md].is_a? Integer
    classes << 'col-lg-'+grid[:lg].to_s if grid[:lg].is_a? Integer
    classes << 'col-offset-sm-'+grid[:offset_sm].to_s if grid[:offset_sm].is_a? Integer
    classes << 'col-offset-md-'+grid[:offset_md].to_s if grid[:offset_md].is_a? Integer
    classes << 'col-offset-lg-'+grid[:offset_lg].to_s if grid[:offset_lg].is_a? Integer
    classes.uniq.join(" ")
  end

end
