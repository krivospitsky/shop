# https://github.com/justinfrench/formtastic/issues/625
module Formtastic
  module Inputs
    module Base
      module Wrapping
        def input_wrapping(&block)
          template.content_tag(input_html_options[:wrapper_tag] || :li,
            [template.capture(&block), error_html, hint_html].join("\n").html_safe,
            wrapper_html_options
          )
        end
      end
    end
  end
end