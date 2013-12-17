module ActiveAdmin
  module Views
    module Pages
      class Show < Base
        def custom_attributes_table(*args, &block)
          panel(I18n.t('active_admin.custom_details', :model => I18n.t("activerecord.models." + resource.class.to_s.snakecase, count: 'few'))) do
            attributes_table_for resource, *args, &block
          end
        end
      end
    end
  end
end