Formalwear
============================

Formalwear dresses up your Ruby on Rails forms with [Bootstrap] markup.

Unlike some other libraries that modify existing Rails [FormHelper] methods, Formalwear extends FormHelper with additional methods to generate groups, labels, and controls.

Because existing methods remain (mostly) intact, the option to generate non-Bootstrap markup in your form is preserved.


## Dependencies ##

Rails 3 and Bootstrap 3. A familiarity with Rails FormHelper usage and syntax will be helpful.


## Installation ##

Add the dependency to your `Gemfile`:

    gem 'formalwear', git: 'https://github.com/zacwasielewski/formalwear.git'

Then run `bundle` from the project directory.


## Usage/Syntax ##


### Initializing a Form: ###

To use `formalwear`, create a form with `form_for` or `fields_for` and supply Formalwear as the `:builder` argument:

    <%= form_for (@person, :builder => Formalwear::FormBuilder) do |f| %>


### Generating Form Elements: ###

Formalwear extends `form_for` and `fields_for` with additional methods:

- group
- label
- static

These methods can be used generically to create group elements:

    <%= f.group do %>
        <!-- HTML goes here! -->
    <% end %>
    # =>
    # <div class="form-group">
    #     <!-- HTML goes here! -->
    # </div>

or labels:

    <%= f.label :first_name %>
    # =>
    # <label class="control-label" for="first_name">First name</label>

or text fields:

    <%= f.text_field :first_name %>
    # =>
    # <input type="text" name="first_name" class="form-control">

Or, more conveniently, create a group/label/control all at once:

    <%= f.text_field_group :first_name %>
    # =>
    # <div class="form-group">
    #     <label class="control-label" for="first_name">First name</label>
    #     <input type="text" name="first_name" value="" class="form-control">
    # </div>



### Additional Usage Examples ###
    
Coming soon...


## Todo ##

Tests!

[Bootstrap]: http://twitter.github.com/bootstrap/
[FormHelper]: http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html
