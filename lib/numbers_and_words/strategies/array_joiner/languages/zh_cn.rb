module NumbersAndWords
  module Strategies
    module ArrayJoiner
      module Languages
        class ZhCn < Base
          def union_element
            union_separator.present? ? " #{union_separator}" : ''
          end
        end
      end
    end
  end
end
