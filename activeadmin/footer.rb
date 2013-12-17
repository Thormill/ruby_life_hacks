module ActiveAdmin
  module Views
    module Pages
      class Base < Arbre::HTML::Document
        private

        def build_footer
          div :id => "footer" do
            version = File.exists?("version") ? ", версия: %s" % File.read("version") : ""
            str =  "&copy; Company name #{version}"
            unless Rails.env.production?
              stylesheet_link_tag Rails.env.to_s
            end
          end
        end
      end
    end
  end
end
