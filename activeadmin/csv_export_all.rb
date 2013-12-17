module ActiveAdmin
  class ResourceController
    module Collection
      module Pagination
        def per_page
          return 1_000_000 if %w(text/csv application/xml application/json).include?(request.format)

          return max_per_page if active_admin_config.paginate == false

          @per_page || active_admin_config.per_page
        end
      end
    end
  end
end