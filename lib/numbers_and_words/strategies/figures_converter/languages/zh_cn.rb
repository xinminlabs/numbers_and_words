module NumbersAndWords
  module Strategies
    module FiguresConverter
      module Languages
        class ZhCn < Base
          include Families::Hanzi

          def print_words
            @strings.reverse.join('')
          end
        end
      end
    end
  end
end
