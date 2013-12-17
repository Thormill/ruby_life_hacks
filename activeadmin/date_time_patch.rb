module ActiveAdmin
  module Inputs
    class FilterDateRangeInput < ::Formtastic::Inputs::StringInput
      def input_html_options(input_name = gt_input_name)
          current_value = @object.send(input_name)
          { :size => 12,
            :class => "datepicker",
            :max => 10,
            :value => current_value.respond_to?(:strftime) ? current_value.strftime("%Y-%m-%d %H:%M") : "" }
      end
    end
  end
end
