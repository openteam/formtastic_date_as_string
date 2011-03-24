module FormtasticDateAsString
  # Your code goes here...
end


require 'formtastic'

Formtastic::SemanticFormBuilder.class_eval do

  def date_input(method, options = {})
    value = @object.send(method)
    options.merge! :as => :string
    options.merge! :input_html => { :value => I18n.localize(value)} if value.is_a?(Date)
    self.input(method, options).gsub(/class="string/, 'class="date')
  end

  def input_with_date(method, options={})
    if !options[:as] && @object.is_a?(ActiveRecord::Base) &&
                        @object.column_for_attribute(method).try(:type) == :date
      date_input(method, options)
    else
      input_without_date(method, options)
    end
  end

  alias_method_chain :input, :date

end
