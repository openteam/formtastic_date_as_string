Formtastic::SemanticFormBuilder.class_eval do

  def date_input(method, options = {})
    options[:input_html] ||= {}
    options[:input_html][:class] = [options[:input_html][:class], :date].compact.join ' '
    options[:input_html][:value] = I18n.l(object[method]) if object[method].is_a? Date
    options[:wrapper_html] ||= {}
    options[:input_html][:class] = [options[:wrapper_html][:class], :date].compact.join ' '
    string_input method, options
  end

  def datetime_input(method, options = {})
    options[:input_html] ||= {}
    options[:input_html][:class] = [options[:input_html][:class], :datetime].compact.join ' '
    options[:input_html][:value] = I18n.l(object[method]) if object[method].is_a? DateTime
    options[:wrapper_html] ||= {}
    options[:input_html][:class] = [options[:wrapper_html][:class], :datetime].compact.join ' '
    string_input method, options
  end

  def default_input_type_with_date(method, options={})
    if column_of_type? method, :date
      :date
    elsif column_of_type? method, :datetime
      :datetime
    else
      default_input_type_without_date method, options
    end
  end

  alias_method_chain :default_input_type, :date

  protected

    def column_of_type?(method, type)
      (mongoid_type(method) || active_record_type(method)).to_s.downcase == type.to_s
    end

    def active_record_type(method)
      if defined?(ActiveRecord::Base) && object.is_a?(ActiveRecord::Base) && object.column_for_attribute(method)
        return object.column_for_attribute(method).try(:type)
      end
    end

    def mongoid_type(method)
      if defined?(Mongoid::Document) && object.is_a?(Mongoid::Document) && object.fields[method.to_s]
        return object.fields[method.to_s].options[:type]
      end
    end

end

