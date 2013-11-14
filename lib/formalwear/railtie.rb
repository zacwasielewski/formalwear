require 'formalwear'
require 'rails/railtie'

class Formalwear::Railtie < Rails::Railtie
  initializer 'formalwear.initialize',
    :after => :after_initialize do
    ActionView::Base.send :include, Formalwear::FormBuilder
  end
end