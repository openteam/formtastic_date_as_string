Formtastic::SemanticFormBuilder.class_eval do

  def date_input(method, options = {})
    options[:input_html] ||= {}
    options[:input_html][:class] = [options[:input_html][:class], :date].compact.join ' '
    options[:input_html][:value] = I18n.l(object[method]) if object[method].is_a? Date
    options[:wrapper_html] ||= {}
    options[:input_html][:class] = [options[:wrapper_html][:class], :date].compact.join ' '
    string_input method, options
  end

  def default_input_type_with_date(method, options={})
    if date_column? method
      :date
    else
      default_input_type_without_date method, options
    end
  end

  alias_method_chain :default_input_type, :date

  protected

    def date_column?(method)
      object.respond_to?(:column_for_attribute) &&
         object.column_for_attribute(method).try(:type) == :date
    end
end
