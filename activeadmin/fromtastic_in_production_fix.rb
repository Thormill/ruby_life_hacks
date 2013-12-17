module ActiveAdmin
  class FormBuilder
    def input_class_with_const_defined(as)
      input_class_name = custom_input_class_name(as)

      if ::Object.const_defined?(input_class_name)
        input_class_name.constantize
      elsif ActiveAdmin::Inputs.const_defined?(input_class_name)
        active_admin_input_class_name(as).constantize
      elsif Formtastic::Inputs.const_defined?(input_class_name)
        standard_input_class_name(as).constantize
      elsif Rails.application.config.cache_classes == true and input_class_name.include?("Filter")
        input_class_by_trying(as)
      else
        raise Formtastic::UnknownInputError, "Unable to find input class for #{as}"
      end
    end
  end
end