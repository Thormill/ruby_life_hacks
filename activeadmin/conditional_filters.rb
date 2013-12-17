module ActiveAdmin
  module Filters
    class FormBuilder < ::ActiveAdmin::FormBuilder
      def filter(method, options = {})
        return "" if method.blank?

        if options[:if].is_a?(Proc)
          return "" if !template.instance_eval(&options[:if])
        end

        options[:as] ||= default_input_type(method)
        return "" unless options[:as]

        content = input(method, options)
        form_buffers.last << content.html_safe if content
      end
    end
  end
end